DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(int)
  convert = %w(0 1 2 3 4 5 6 7 8 9)
  string = ''
  int.digits.each { |digit| string += convert[digit] }
  string.reverse
end
