# Define a method attr_accessor_with_history that provides
# the same functionality as attr_accessor but also tracks
# every value the attribute every had.

class Class
  def attr_accessor_with_history(*args)
    args.each do |arg|
      # getter
      self.class_eval(<<-STRING
        def #{arg}
          @#{arg}
        end
      STRING
      )

      # setter
      self.class_eval(<<-STRING
        def #{arg}=(val)
          @#{arg} = val
          @#{arg}_history = [] if @#{arg}_history.nil?
          @#{arg}_history.push(val)
        end
      STRING
      )

      # history
      self.class_eval(<<-STRING
        def history(#{arg})
          @#{arg.to_sym}_history
        end
      STRING
      )
    end
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 2 # => 2
f.bar = :wowzo # => :wowzo
f.bar = 'boo!' # => 'boo!'
f.history(:bar).length # => [2, :wowzo, 'boo!']
