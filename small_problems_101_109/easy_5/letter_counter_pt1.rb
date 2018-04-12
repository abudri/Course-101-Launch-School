def word_sizes(string)
  hash = {}
  array = string.split
  array.each do |word|
    if hash[word.size] # if hash key exists, tally its value 
      hash[word.size] += 1 
    else # else if key doesn't exist, create it, set value to 1
      hash[word.size] = 1
    end 
  end 
  hash 
end 

=begin
Describe your inputs, outputs, and data structures:
Inputs: 'string' as argument
Outputs:  hash, with the count of string lengths not including spaces, tallied. 
Data structure(s): intake string, output hash

Describe your algorithm: in the definition, create a hash ti intake values. take the string argument, convert it to an array using String#split, this removes spaces and preserves all other caracthers, like '.' and ',', and '!' and such.  Get the count of 7, 6 letter words, and so on (use #size) using Array#count for each element, array[0].count, and input that count with the Array value along with its associated count into the hash. 
=end

