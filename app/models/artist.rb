class Artist < ApplicationRecord

  # require 'net/http'
  # require 'json'

  has_many :shows, dependent: :destroy
  # TODO: get default scope as name (ignore case) (sql command)
  default_scope -> { order(name: :asc) }
  validates :name, presence: true, length: { maximum: 100 }
  validates :name, uniqueness: { case_sensitive: false }

  class << self
    def artist_csv
      csv_text = File.read('app/assets/csv/artists.csv')
      csv = CSV.parse(csv_text, headers: true)
      csv['Artist']
    end

    def show_deal_ids
      #  deal_ids = Shows.where(artist: self.name)
      # replace with
      deal_ids = Show.where('artist = ?', name)
    end

    # Search by an artist name.
    def search(search)
      Artist.where('name like ?', "%#{search}%")
    end

    # Returns a hash of the roster's tops top_songs
    #   key is artist name
    #  value is top song name
    def roster_top_songs
      songs = Hash.new
      Artist.all.each do |artist|
        begin
          song = artist.top_song_names[0]
          songs[artist.name] = song
        rescue URI::InvalidURIError
          puts "Unable to retrive song for #{artist.name}"
        rescue NoMethodError
          puts "'NoMethodError' for #{artist.name}"
        end
      end
      return songs
    end

  # end of the class methods
  end

  # gets the five top tracks for the artist
    # keys are the song names
    # values are last.fm url's
    #TODO include playcounts
  def top_tracks
    key = ENV.fetch("LAST_FM_API_KEY")
    url = "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=#{self.name}&api_key=#{key}&format=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def top_song_names
    tracks = self.top_tracks
    names = Array.new
    5.times do |n|
      names << tracks["toptracks"]["track"][n]["name"]
    end
    return names
  end
end