# The Enumerable module includes and iterator each_with_index
# that yields each enumerable element along with an index 
# starting from zero.

#%w(alice bob carol).each_with_index do |person, index|
#  puts ">> #{person} is number #{index}." 
#end

# Create an iterator each_with_custom_index in module
# Enumerable that lets you determine the starting
# value and step of the indices

module Enumerable 
  def each_with_custom_index(start_index, step)
    self.each_with_index do |item, index|
      yield item, start_index + (step * index)
    end
  end
end


%w(alice bob carol).each_with_custom_index(3, 2) do |person, index|
  puts ">> #{person} is number #{index}"
end


# >> alice is number 3
# >> bob is number 5
# >> carol is number 7
