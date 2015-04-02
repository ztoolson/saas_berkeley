class Dessert

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  attr_accessor :name, :calories

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert

  def initialize(flavor)
    flavor == 'licorice' ? name = 'jelly bean' : name ='vanilla jelly bean'
    super(name, 5)
    @flavor = flavor
  end

  attr_accessor :flavor

  def delicious?
    flavor == 'licorice' ? false :  true
  end

end
