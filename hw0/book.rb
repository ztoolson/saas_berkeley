# Define a class BookInStock which represents a book with an isbn number,
# and price of the book as a floating point number, price, as attributes.

class BookInStore
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    # validate input
    fail ArgumentError if isbn.empty? || price.to_f.round(2) <= 0

    @isbn = isbn
    @price = price
  end

  def price_as_string
    '$' + sprintf('%.2f', @price)
  end
end
