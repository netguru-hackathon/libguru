# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Not cool bro! But as you wish, I am fabricating some gems...'

libraries = Array.new
repositories = Array.new

5.times do
  library = Library.create(
    name: Faker::Witcher.monster,
    url: Faker::Internet.url('github.com'),
    dependencies_count: rand(10)
    )
  libraries << library
end

5.times do
  repository = Repository.create(
    name: Faker::Pokemon.name,
    url: Faker::Internet.url('github.com')
    )
  repositories << repository
end

counter = 0
libraries.each do |lib|
  Dependency.create(
    library_id: lib.id,
    repository_id: repositories[counter]
    )
  counter += 1
end

puts 'Fake gems (libraries) created. Don\'t try to sell them!'
