# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |n|
  Theater.create(:name => "映画館#{n+1}")
end

3.times do |n|
  Screen.create(:screen => n+1, :theater_id => 1)
end

3.times do |n|
  Screen.create(:screen => n+1, :theater_id => 2)
end

(0..14).each do |n|
 if n <= 4
  Sheet.create(:column => n+1, :row => 'a', :screen_id => 1, :theater_id => 1)
 elsif n <= 9
  Sheet.create(:column => n+1, :row => 'b', :screen_id => 1, :theater_id => 1)
 elsif n <= 14
  Sheet.create(:column => n+1, :row => 'c', :screen_id => 1, :theater_id => 1)
 end
end

(0..14).each do |n|
  if n <= 4
   Sheet.create(:column => n+1, :row => 'a', :screen_id => 2, :theater_id => 1)
  elsif n <= 9
   Sheet.create(:column => n+1, :row => 'b', :screen_id => 2, :theater_id => 1)
  elsif n <= 14
   Sheet.create(:column => n+1, :row => 'c', :screen_id => 2, :theater_id => 1)
  end
 end

 (0..14).each do |n|
  if n <= 4
   Sheet.create(:column => n+1, :row => 'a', :screen_id => 3, :theater_id => 1)
  elsif n <= 9
   Sheet.create(:column => n+1, :row => 'b', :screen_id => 3, :theater_id => 1)
  elsif n <= 14
   Sheet.create(:column => n+1, :row => 'c', :screen_id => 3, :theater_id => 1)
  end
 end

 (0..14).each do |n|
  if n <= 4
   Sheet.create(:column => n+1, :row => 'a', :screen_id => 1, :theater_id => 1)
  elsif n <= 9
   Sheet.create(:column => n+1, :row => 'b', :screen_id => 1, :theater_id => 1)
  elsif n <= 14
   Sheet.create(:column => n+1, :row => 'c', :screen_id => 1, :theater_id => 1)
  end
 end
 
 (0..14).each do |n|
   if n <= 4
    Sheet.create(:column => n+1, :row => 'a', :screen_id => 2, :theater_id => 2)
   elsif n <= 9
    Sheet.create(:column => n+1, :row => 'b', :screen_id => 2, :theater_id => 2)
   elsif n <= 14
    Sheet.create(:column => n+1, :row => 'c', :screen_id => 2, :theater_id => 2)
   end
  end
 
  (0..14).each do |n|
   if n <= 4
    Sheet.create(:column => n+1, :row => 'a', :screen_id => 3, :theater_id => 2)
   elsif n <= 9
    Sheet.create(:column => n+1, :row => 'b', :screen_id => 3, :theater_id => 2)
   elsif n <= 14
    Sheet.create(:column => n+1, :row => 'c', :screen_id => 3, :theater_id => 2)
   end
  end