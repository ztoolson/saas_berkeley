# 3.3 Bulding on the example in Section 3.5, take advantage of
# Time's duck typing to define a method at_beginning_of_year that
# lets you write:
#
# Time.now.at_beginning_of_year + 1.day
# # => 2011-01-02 00:00:00 -800
#
# Hint 1: The Time documentation wil ltell you that the local
# class method can be used to create a new Time object with a
# specified year, month, and day
#
# Hint 2: The receiver of at_beginning_of_year in the above code is now,
# just as it was in the example in Section 3.5. But unlike that example,
# think carefully about how you'd like now to quack.

class Time
  def at_beginning_of_year
    Time.new(self.year)
  end
end

class Fixnum
  def days
    self * 60 * 60 * 24
  end

  def method_missing(method_id, *args)
    name = method_id.to_s
    if name =~ /^day$/
      self.send(name + 's')
    else
      super
    end
  end
end
