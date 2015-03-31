# Recall that the first two integers in the Fibionacci sequence
# are 1 and 1, and each successive Fibonacci number is the sum of
# the previous two. Create a class that returns an iterator for the
# first n Fibonaci numbers


class FibSequence
  include Enumerable

  attr_reader :n

  def initialize(n)
    @n = n
  end

  def each
    calls = 0
    a = 1
    b = 1

    while calls <= 1
      yield 1
      calls +=1
    end

    while(calls < n)
      yield a + b
      a = a + b
      b = a - b
      calls += 1
    end
  end
end

f = FibSequence.new(6)
f.each { |s| print(s, ':') } # => 1:1:2:3:5:8:
f.reject { |s| s.odd? } # => [2, 8]
f.reject(&:odd?) # => [2, 8]
f.map { |x| 2*x } # => [2, 2, 4, 6, 10, 16]
