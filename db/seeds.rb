# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Not cool bro! But as you wish, I am fabricating some gems..."

3.times do
  name = FFaker::Name.first_name.downcase
  Library.create(
    name: name,
    url: "http://github.com/netguru/#{name}",
    dependencies_count: rand(10)
  )
end

3.times do
  name = FFaker::Name.last_name.downcase
  Repository.create(
    name: name,
    url: "http://github.com/netguru/#{name}"
  )
end

Dependency.create(
  [
    { repository_id: 1, library_id: 1 },
    { repository_id: 1, library_id: 3 },
    { repository_id: 1, library_id: 2 },
    { repository_id: 3, library_id: 1 },
    { repository_id: 3, library_id: 3 },
    { repository_id: 2, library_id: 1 },
  ],
)

puts "Fake gems (libraries) created. Don\'t try to sell them!"
