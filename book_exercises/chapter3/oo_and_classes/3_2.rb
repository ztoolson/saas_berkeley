# 3.2 Given that superclass returns nil when called on BasicObject
# but a non-nil value otherwise, write a ruby method that, if passed an object
# will print the objects class and its ancestor classes all the way up to
# Basic Object

def print_ancestors(obj)
  current_super_class = obj.class.superclass
  until current_super_class.nil?
    puts current_super_class
    current_super_class = current_super_class.superclass
  end
end
