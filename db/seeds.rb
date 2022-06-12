# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Theater.create(:id => 1, :name => "映画館1")
Theater.create(:id => 2, :name => "映画館2")

3.times do |n|
  Screen.create(:id => n+1, :screen => n+1, :theater_id => 1)
end

3.times do |n|
  Screen.create(:id => n+4, :screen => n+1, :theater_id => 2)
end

(0..14).each_with_index do | n, i|
 if n <= 4
  Sheet.create(:id => i+1, :column => n+1, :row => 'a', :screen_id => 1, :theater_id => 1)
 elsif n <= 9
  Sheet.create(:id => i+1, :column => n+1, :row => 'b', :screen_id => 1, :theater_id => 1)
 elsif n <= 14
  Sheet.create(:id => i+1, :column => n+1, :row => 'c', :screen_id => 1, :theater_id => 1)
 end
end

(0..14).each_with_index do | n, i|
  if n <= 4
   Sheet.create(:id => i+16, :column => n+1, :row => 'a', :screen_id => 2, :theater_id => 1)
  elsif n <= 9
   Sheet.create(:id => i+16, :column => n+1, :row => 'b', :screen_id => 2, :theater_id => 1)
  elsif n <= 14
   Sheet.create(:id => i+16, :column => n+1, :row => 'c', :screen_id => 2, :theater_id => 1)
  end
 end

 (0..14).each_with_index do | n, i|
  if n <= 4
   Sheet.create(:id => i+31, :column => n+1, :row => 'a', :screen_id => 3, :theater_id => 1)
  elsif n <= 9
   Sheet.create(:id => i+31, :column => n+1, :row => 'b', :screen_id => 3, :theater_id => 1)
  elsif n <= 14
   Sheet.create(:id => i+31, :column => n+1, :row => 'c', :screen_id => 3, :theater_id => 1)
  end
 end

 (0..14).each_with_index do | n, i|
  if n <= 4
   Sheet.create(:id => i+46, :column => n+1, :row => 'a', :screen_id => 1, :theater_id => 2)
  elsif n <= 9
   Sheet.create(:id => i+46, :column => n+1, :row => 'b', :screen_id => 1, :theater_id => 2)
  elsif n <= 14
   Sheet.create(:id => i+46, :column => n+1, :row => 'c', :screen_id => 1, :theater_id => 2)
  end
 end

 (0..14).each_with_index do | n, i|
   if n <= 4
    Sheet.create(:id => i+61, :column => n+1, :row => 'a', :screen_id => 2, :theater_id => 2)
   elsif n <= 9
    Sheet.create(:id => i+61, :column => n+1, :row => 'b', :screen_id => 2, :theater_id => 2)
   elsif n <= 14
    Sheet.create(:id => i+61, :column => n+1, :row => 'c', :screen_id => 2, :theater_id => 2)
   end
  end
 
(0..14).each_with_index do | n, i|
   if n <= 4
    Sheet.create(:id => i+76, :column => n+1, :row => 'a', :screen_id => 3, :theater_id => 2)
   elsif n <= 9
    Sheet.create(:id => i+76, :column => n+1, :row => 'b', :screen_id => 3, :theater_id => 2)
   elsif n <= 14
    Sheet.create(:id => i+76, :column => n+1, :row => 'c', :screen_id => 3, :theater_id => 2)
   end
  end

  AdminUser.find_or_create_by(id: 1) do |admin|
    admin.email = "example@example.com"
    admin.password = "example"
   end