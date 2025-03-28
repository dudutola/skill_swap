# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

User.destroy_all
Issue.destroy_all

# Tags
tags = ["Variables", "Ruby", "Rails", "CSS", "HTML", "Terminal", "VSCode", "JavaScript", "Linux", "PostgreSQL"]

tags.each do |tag_name|
  Tag.find_or_create_by(name: tag_name)
end

puts "✅ Tags seeded successfully!"


10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    github_username: Faker::Internet.username,
    github_name: Faker::Name.name,
    github_location: Faker::Address.country,
    github_avatar_url: "https://i.pravatar.cc/150?img=#{rand(1..70)}",
    provider: 'github',
    github_uid: SecureRandom.uuid
  )
  puts "Created user #{user.github_name}"
end


issues = [
  { title: "Bug in Login Form", description: "I’m unable to log in with the correct credentials. When I enter my username and password, it doesn’t redirect me to the homepage. Can anyone help debug this issue?", available_on: "Weekends, from 2pm to 5pm UTC" },
  { title: "CSS Layout Issue", description: "The layout looks fine on desktop but breaks on mobile devices. The columns are not stacking properly. Anyone have suggestions on fixing this responsiveness issue?", available_on: "Monday, from 9 AM to 11 AM UTC"  },
  { title: "API Call Fails", description: "My API call to fetch user data is returning a 500 error. The API URL is correct, but the data isn't showing up. How can I fix this?", available_on: "Wednesday, from 10 AM to 12 PM UTC"  },
  { title: "Missing Image on Profile Page", description: "The profile image is not displaying on my profile page. I’ve uploaded it correctly, but it’s showing a broken image icon. Any ideas on what could be wrong?", available_on: "Thursday, from 2 PM to 4 PM UTC"  },
  { title: "Database Migration Issue", description: "I’m having trouble running a migration to add a new column to my users table. The migration is failing, and I can’t figure out why. Can anyone offer advice?", available_on: "Friday, from 11 AM to 1 PM UTC"  },
  { title: "JavaScript Error in Console", description: "I’m getting an 'undefined' error in the console when trying to access a property in my JavaScript code. I’ve checked my syntax but still can’t figure out what’s wrong.", available_on: "Saturday, from 3 PM to 5 PM UTC"  },
  { title: "Unable to Deploy to Heroku", description: "I’ve tried deploying my app to Heroku, but I’m getting a 'push rejected' error. The logs don’t provide much detail, and I’m not sure how to resolve it." , available_on: "Sunday, from 4 PM to 6 PM UTC" },
]

tags = Tag.all

issues.each do |issue|
  user = User.all.sample

  Issue.create!(
    user: user,
    title: issue[:title],
    description: issue[:description],
    available_on: issue[:available_on],
    tags: tags.sample(2),
    created_at: Faker::Time.backward(days: 14, period: :evening)
  )

  # issue_record.tags = tags.sample(2)

  puts "Created issue for #{user.github_name}: #{issue[:title]}"
end

# Appointment.create!(tutor: User.first, pupil: User.second, issue: Issue.all.sample, start_time: Time.new, end_time: Time.new)
