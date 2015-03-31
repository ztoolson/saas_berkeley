module Enumerable 
  def zach_map
    out = []
    if block_given?
      self.each { |item| out << yield(item) }
    else
      out = to_enum :zach_map
    end
  end
end

result = %w(alice bob carol).map do |item|
  item.upcase
end

puts result
