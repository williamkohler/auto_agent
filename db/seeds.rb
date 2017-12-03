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
