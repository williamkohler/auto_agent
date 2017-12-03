# Users
#TODO user options = admin, manager, agent, buyer
User.create!(name: "Bill Kohler",
             email: "bkohler4@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


User.create!(name: "Admin User",
             email: "admin@example.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "Standard User",
            email: "user@example.com",
            password: "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)


99.times do |n|
  # name = Faker::Name.name
  name = Faker::TwinPeaks.character
  email = "example-#{n+1}@example.com"
  password = "foobar"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


# Artists
Artist.create!(name: "Chromatics")
Artist.create!(name: "Jai Paul")
Artist.create!(name: "Radiohead")
Artist.create!(name: "Talking Heads")
Artist.create!(name: "Amy Winehouse")
Artist.create!(name: "The Smiths")
Artist.create!(name: "Tom Waits")
Artist.create!(name: "Interpol")
Artist.create!(name: "Portishead")
Artist.create!(name: "The Hold Steady")

# Shows
Artist.all.each do |artist|
  4.times do |n|
    promoter = Faker::TwinPeaks.character
    production = Faker::TwinPeaks.character
    Show.create!(artist: artist.name,
                 artist_id: artist.id,
                 start_date: Faker::Time.between(
                            Date.today, 2.years.from_now, :night),
                venue_name: Faker::TwinPeaks.location,
                address: Faker::Address.street_address + ", " +  Faker::Address.city + ", " + Faker::Address.state_abbr,
                capacity: rand(100..3000),
                ticket_scale: "TBD",
                gross_potential: "TBD",
                start_time: "8:00PM",
                set_length: "Seventy-five to ninety (75-90) minutes",
                num_of_shows: 1,
                other_acts: Faker::RockBand.name,
                deposit_due: 5000,
                deposit_received: 0,
                fee: 10000,
                backend: "flat guarantee",
                hotel: "one (1) suite and two (2) single hotel rooms",
                backline: "per artist rider",
                promoter_name: promoter,
                promoter_phone: Faker::PhoneNumber.phone_number,
                promoter_email: "#{promoter.downcase.tr(" ", "_")}@gmail.com",
                production_name: production,
                production_phone: Faker::PhoneNumber.phone_number,
                production_email: "#{production.downcase.tr(" ", "_")}@gmail.com")
    end
  end
