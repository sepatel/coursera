def palindrome?(string)
  trimmed = string.gsub(/\W/, '').downcase
  trimmed == trimmed.reverse
end

def count_words(string)
  hash = {}
  string.split(/\b/).each {|token|
    token.downcase!
    if token.match /\w/
      hash[token] = 0 if hash[token].nil?
      hash[token] = hash[token] + 1
    end
  }
  hash
end

