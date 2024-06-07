# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

puts "[Start]: Create fake articles data"

100.times do
  Article.create(
    title: Faker::Book.title,
    text: Faker::Lorem.paragraphs(number: 3).join("\n\n")
  )

  Song.create(
    title: Faker::Book.title,
    artist: Faker::Book.author,
    genre: Faker::Music.genre,
    lyrics: Faker::Lorem.paragraph,
  )
rescue StandardError => e
  puts e.message
  puts e.backtrace.join("\n")
  
end

puts "[End]: Created 100 fake articles."

