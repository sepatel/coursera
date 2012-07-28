def combine_anagrams(words)
  groups = {}
  words.each {|word|
    array = word.downcase.each_char.sort
    groups[array] = [] unless groups.has_key? array
    groups[array] << word
  }
  return groups.values
end

