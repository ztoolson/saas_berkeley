# Define a method sum which takes an array of integers as an
# argument and return the sum of its elements.
def sum(arr)
  return 0 if arr.empty?
  arr.reduce(:+)
end

# Define a method max_2_sum which takes an array of integers as an
# argument and returns the sum of the largers 2 elements.
#
# For an empty array it should return 0, for an array with just one
# element, it should return that element
def max_2_sum(arr)
  return 0 if arr.empty?
  arr.sort.reverse[0..1].reduce(:+)
end

# Define a method sum_to_n? which takes an array of integers and an 
# additional integer, n, as arguments and return true if any two distinct
# elements in the array sum to n. An empty array or single element array
# should both return false.
def sum_to_n?(arr, n)
  return false if arr.empty? || arr.length == 1
  arr.permutation(2).any? { |a, b| a + b == n }
end
