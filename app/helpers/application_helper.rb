module ApplicationHelper

  # require 'net/http'
  # require 'json'

  # Returns the full title on a per-page basis.       # Documentation Comment
  def full_title(page_title= '')                      # Method def, option arg
    base_title = "Auto Agent"                      # Variable Assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      page_title + " | " + base_title                 # String concatenation
    end
  end

  # Capitializes the first letter of a string
  def cap_first_letter string
    string[0] = string[0].capitalize
    return string
  end

  # Returns a hash of the top five top_songs for an artist
  # Key is the name of the song
  # Value is the last.fm url
  def artist_top_tracks artist
    api_key = ENV.fetch("LAST_FM_API_KEY")
    url = "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=#{artist}&api_key=#{api_key}&format=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    top_songs = Hash.new
    5.times do |n|
      top_songs[json['toptracks']['track'][n]['name']] =
      json['toptracks']['track'][n]['url']
    end
    return top_songs
  end

  def weekly_albums user
    key = ENV.fetch("LAST_FM_API_KEY")
    url = "http://ws.audioscrobbler.com/2.0/?method=user.getweeklyalbumchart&user=#{user}&api_key=#{key}&format=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  # top fifty albums for a last.fm user
  def top_albums user
    key = ENV.fetch("LAST_FM_API_KEY")
    url = "http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=#{user}&api_key=#{key}&format=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end



end
