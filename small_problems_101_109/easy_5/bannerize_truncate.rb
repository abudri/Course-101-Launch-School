def truncate_string(string)
  max = 76 # we have two borders with a space cushion, so 80 minus 4 is 76
  string.size > max ? string = string[0..76] : string
  # if string is larger than 76, set string to 0..76 characters, otherwise, return string (: string)
end 

def print_in_box(str)

new_str = truncate_string(str)

top_and_bottom_lines = new_str.chars.map {|char| '-'}.join
lines_two_and_four = new_str.chars.map {|char| ' '}.join

puts '+-' + top_and_bottom_lines + '-+'
puts '| ' + lines_two_and_four + ' |'
puts '| ' + new_str + ' |'
puts '| ' + lines_two_and_four + ' |'
puts '+-' + top_and_bottom_lines + '-+'
end 
  
=begin 

pg 564 of your doc has info 

Bannerizer
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
print_in_box('')
+--+
|  |
|  |
|  |
+--+

Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures:
Inputs: string 
Outputs: string, surrounded by box
Data structure(s):

Describe your algorithm: basically, need to account for size in the top, 2nd, 3rd, 4th, and 5th lines, we are 'put' putting out, so String.size should come to advantage

Begin coding

=end 
