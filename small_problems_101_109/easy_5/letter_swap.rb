def letter_swap(word)
  word[0], word[-1] = word[-1], word[0]
  word 
end 

def reverse_string(string)
  result = string.split.map! do |word|
    letter_swap(word)
  end
  result.join(' ')
end 
