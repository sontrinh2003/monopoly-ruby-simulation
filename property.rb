# Property Class: Represents a property on the board
# Attributes: name, price, color, owner
# Methods: Initialize property from data

class Property < Space
  attr_accessor :price, :color, :owner

  def initialize(data)
    super(data["name"], "property")
    @price = data["price"]
    @color = data["color"]
    @owner = nil
  end
end