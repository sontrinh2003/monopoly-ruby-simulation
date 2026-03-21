# Property Class: Represents a property on the board
# Attributes: name, price, color, owner
# Methods: Initialize property, update owner

class Property
  attr_accessor :name, :price, :color, :owner

  def initialize(data)
    @name = data["name"]
    @price = data["price"]
    @color = data["color"]
    @owner = nil
  end
end