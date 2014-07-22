# Define a class BookInStock which represents a book with an isbn number,
# and price of the book as a floating point number, price, as attributes.

class BookInStore

  def initialize(isbn, price)
    # validate input
    if isbn.empty? || price.to_f.round(2) <= 0
      raise ArgumentError
    end

    @isbn = isbn
    @price = price
  end

  attr_accessor :isbn, :price

  def price_as_string
    '$' + sprintf('%.2f', @price)
  end
end
