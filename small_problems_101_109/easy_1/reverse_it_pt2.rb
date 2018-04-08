def reverse_words_funky(string)
  new_string = string.split.reverse.each do |word|
    if word.size >= 5
      word.reverse!
    end
  end 
  new_string.join(' ')
end

reverse_words_funky('hi there mary poppins')

=begin
Reverse It (Part 2)
Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures
Inputs: string word, one or more
Outputs: string word, one ore more, with only strings with String#size 5 or more reversed, otherwise reverse word order but the letters are not reversed.

Data structure(s): strings, array, back to strings

Describe your algorithm: convert the string into an array with String#split.  for each word that is String#size 5 or more, reverse the string with String#reverse, otherwise keep same order.  then reverse the array, and use Array#join to return the reversed sentence.

Begin coding

=end
