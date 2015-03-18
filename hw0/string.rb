# Define a method hello(name) that takes a string representing
# a name and return the string "Hello, " concatenated with the name
def hello(name)
  "Hello, #{name}"
end

# Define a method that takes a string and return true if it
# starts with a consonant (anything other than AEIOU)
def starts_with_consonant?(s)
  (s =~ /^[^aeiou]/i) == 0 ? true : false
end

# Define a method binary_multiple_of4?(s) that takes a string and returns
# true if the string represents a binary number that is a multiple of 4.
# NOTE Be sure the string is a valid binary number
def binary_multiple_of_4?(s)
  return false if s.to_i(2) == 0 # invalid parsing of binary number
  s.to_i(2) % 4 == 0
end
