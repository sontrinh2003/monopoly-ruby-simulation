# Space Class: Represents a space on the board
# Attributes: name, type (property, chance, GO, etc.)
# Furuther enhancements: chance/community chest, tax spaces, jail, etc will inherit from this base class 
# and add specific attributes/methods as needed

class Space 
  attr_accessor :name, :type
 
  def initialize(name, type)
    @name = name
    @type = type
  end
end