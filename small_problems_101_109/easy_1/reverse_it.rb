def reverse_words(string)
  string.split(' ').reverse.join(' ')
end

# Array#split returns an array with each word as an element, ones separated by a space, ' '
# Array#reverse, reverses the array
# Array#join, joins the array with ' ' in between the words, creating a string sentence reversed

