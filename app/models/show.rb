class Show < ApplicationRecord
  require 'csv'
  require 'date'
  # validates :artist, presence: true
  # validates :start_date, presence: true
  # validates :deal_stage, presence: true

  # Find a hubspot contact by it's email
  def hubspot_contact(email)
    Hubspot::Contact.find_by_email email
  end

  # Find a hub deal by it's 'deal_id'
  def self.find_hubspot_deal(deal_id)
    Hubspot::Deal.find deal_id
  rescue Hubspot::RequestError
    Show.find_by(deal_id: deal_id).destroy
  end

  # Reads the hubspot csv file
  # can look up 'Artist' & 'Deal ID'
  def self.hubspot_csv
    csv_text = File.read('app/assets/csv/hubspot.csv')
    CSV.parse(csv_text, headers: true)
  end

  def self.hubspot_artists
    artists = Array new
    csv_text = File.read('app/assets/csv/hubspot.csv')
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      if !artists.include? row["Artist"]
        artists << row["Artist"]
      end
    end
    artists.shift # removes the headers
    artists.sort_by(&:downcase)
  end


  #TODO make sure the method is safe from sql injection
  # Creates shows from an imported csv file
  def self.import file
    file_name = file.path
    text = File.read(file_name, encoding: 'UTF-8')
    saved_shows = Array.new
    unsaved_shows = Array.new
    shows = {}
    csv = CSV.parse(text, headers: true, header_converters: :symbol)
    csv.each do |row|
      show = Show.new
      show.deal_id = row[:deal_id]
      show.artist = row[:artist]
      show.artist_id = Artist.find_by(name: row[:artist]).id
      show.deal_stage = row[:deal_stage]
      show.start_date = row[:start_date]
      begin
        if show.save
          saved_shows << show
        else
          unsaved_shows << show
        end
      rescue
        puts "csv deal creation error: #{$!}"
        unsaved_shows << show
      end
    end
    shows[:saved] = saved_shows
    shows[:unsaved] = unsaved_shows
    return  shows
  end


  # Returns an array of all hubspot shows for an artist.
  #TODO rescue w/ error
  def self.get_hubspot_shows(artist)
    issued = "323905d1-2784-4fc5-b4bd-d544348f2668"
    today = Time.zone.now
    hubspot_shows = Array.new
    db_records = Show.where(artist: artist).to_a
    db_records.sort_by!(&:start_date) # sort by start date
    db_records.each do |record|
      #TODO Make sure the date comparision is working correctly.
      if today <= record.start_date
        show = find_hubspot_deal record[:deal_id]
        if show[:dealstage] == issued
          hubspot_shows << show
        end
      end
      end
    return hubspot_shows
  end

  def self.confirmed_hubspot_check(shows)
    issued = "323905d1-2784-4fc5-b4bd-d544348f2668"
    today = Time.now.utc
    shows.each do |show|
      if show[:dealstage] != issued
        puts show[:dealname]
      end
    end
  end


end
