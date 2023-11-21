# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 30.times do
#   u = User.new(first_name: Faker::JapaneseMedia::DragonBall.character, last_name: Faker::JapaneseMedia::DragonBall.race,  email: Faker::Internet.email(domain: 'gmail.com'),password: '123456')
#   u.save!
#   EventPlayer.create!(event_id: Event.first[:id], player_id: u[:id], team_id: Event.first.teams[rand(0..2)][:id])
#   puts "Mission complete"
# end
