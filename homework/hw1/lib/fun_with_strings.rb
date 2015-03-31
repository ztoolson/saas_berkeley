module FunWithStrings
  def palindrome?
    # remove all characters not letters
    str = self.downcase.gsub(/[^a-z]/, '')
    str.reverse == str
  end

  # return a hash whose keys are words, and values are number of times
  # the word has appeared
  def count_words
    # clean up string
    str = self.downcase.gsub(/[^a-z0-9\s]/, '') # only keep letters, numbers, and whitespace
    str = str.gsub(/\s+/m, ' ') # remove excess whitespace

    # add each word to the hash
    hash = Hash.new(0)
    str.split.each do |word|
      hash[word] += 1
    end

    hash
  end

  def anagram_groups
    # clean up string
    str = self.downcase.gsub(/[^a-z0-9\s]/, '') # only keep letters, numbers, and whitespace
    str = str.gsub(/\s+/m, ' ') # remove excess whitespace

    arr = Array.new(Array.new())

    # add each word to array group
    str.split.each do |word|
      added = false

      # does array group already exist?
      if not arr.empty?
        # check each subgroup
        arr.each do |subgroup|
          # word is part of anagram group if it is the same as another word sorted
          if word.sort == subgroup[0].sort
            subgroup << word
            added = true
            break
          end
        end
      end

      # item not already in list, create array with word as item,
      # and append to arr
      arr << [word] if not added
    end

    arr
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings

  def sort
    self.chars.sort.join
  end
end
