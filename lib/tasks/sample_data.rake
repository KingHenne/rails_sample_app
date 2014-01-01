namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    puts "-- create first user 'Hendrik Liebau'"
    User.create!(name: "Hendrik Liebau",
                 email: "mail@hendrik-liebau.de",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)

    puts "-- create 99 more example users"
    99.times do |n|
      name = Faker::Name.name
      email = "user-#{n+1}@example.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      print '.'
    end
    puts

    puts "-- create example microposts for the first 6 users"
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
      print '.'
    end
    puts
  end
end
