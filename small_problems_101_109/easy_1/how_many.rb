vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(arr)
  occurrences = {}
  
  arr.each do |word|
    occurrences[word] = arr.count(word)
  end
  
  occurrences.each do |word, count|
    puts "#{word} => #{count}"
  end 
end

count_occurrences(vehicles) 
