# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  Sheet.create(:column => n+1, :row => 'a')
end

5.times do |n|
  Sheet.create(:column => n+1, :row => 'b')
end

5.times do |n|
  Sheet.create(:column => n+1, :row => 'c')
end

3.times do |n|
  Screen.create(:screen => n+1 )
end