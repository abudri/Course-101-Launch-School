def room_size
  
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_f 
  
  puts "Enter the width of the room in meters:"
  width = gets.chomp.to_f 
  
  size = length * width
  size_sq_ft = size * 10.7639
  
  puts "The area of the room is #{size} square meters (#{size_sq_ft} square feet)"
end

=begin

How big is the room?
Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
=end
