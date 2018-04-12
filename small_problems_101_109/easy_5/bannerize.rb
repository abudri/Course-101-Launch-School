def print_in_box(str)

top_and_bottom_lines = str.chars.map {|char| '-'}.join
lines_two_and_four = str.chars.map {|char| ' '}.join

puts '+-' + top_and_bottom_lines + '-+'
puts '| ' + lines_two_and_four + ' |'
puts '| ' + str + ' |'
puts '| ' + lines_two_and_four + ' |'
puts '+-' + top_and_bottom_lines + '-+'
end 
