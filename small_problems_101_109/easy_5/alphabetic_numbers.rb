NUM_HASH = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
  5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight',
  9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve',
  13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',
  17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
}

def alphabetic_number_sort(arr) # arr is (0..19).to_a
  english_arr = arr.map do |num|
    num = NUM_HASH[num]
  end 
  english_arr.sort!
  new_num_arr = english_arr.map do |english_num|
    english_num = NUM_HASH.key(english_num)
  end
  new_num_arr
end 


def truncate_string(string)
  max = 76 # we have two borders with a space cushion, so 80 minus 4 is 76
  string.size > max ? string = string[0..76] : string
  # if string is larger than 76, set string to 0..76 characters, otherwise, return string (: string)
end 


=begin 

Alphabetical Numbers
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures:
Inputs: array, (0..19).to_a, [0, 1, 2, ... 17, 18, 19]
Outputs:  array of same numbers, but sorted according to string name order [8('eight', 18('eighteen')... 0('zero']
Data structure(s): array is input(numbers 1-19), array is output, but in english name order but same numbers 1-19.  I think an hash could be used to pair the numbers and english names

Describe your algorithm: taken in the array for 0 through 19, convert each number key to its english value.  sort that array according using .sort on the array, will sort strings appropriately. using hash constant, convert at array with its order back to the key values (the numbers)

Begin coding

=end 
