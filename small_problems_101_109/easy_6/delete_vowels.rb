def remove_vowels(str_array)
  vowels = 'aeiou'
  
  str_array.map! do |string|
    string.each_char do |char|
      string.delete(char) if vowels.include?(char.downcase)
      binding.rb
    end 
  end 
  
end
