
class BookInStock
  
  attr_accessor :isbn, :price
  def initialize(isbn, price)
    fail ArguementError if isbn.empty? || price.to_f.round(2) <= 0

    @isbn = isbn
    @price = price
  end
end
