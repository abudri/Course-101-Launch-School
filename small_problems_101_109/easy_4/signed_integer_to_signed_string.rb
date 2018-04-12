# https://launchschool.com/exercises/3c1388d3
# Smaller Problems 101-109, Easy 4

DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(integer)
  string = integer.digits.reverse.map {|element| DIGITS[element]}.join
  string
end 

def signed_integer_to_string(num)
  sign = ''
  case num <=> 0 
  when -1 then sign = "-"
  when +1 then sign = "+"
  end
  num = -num if sign == '-'
  "#{sign}#{integer_to_string(num)}"
end
