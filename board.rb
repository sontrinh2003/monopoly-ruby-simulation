# Monopoly Board: Manage the board and its spaces
# Spaces: Array of Property objects, indexed by position on the board
# Methods: Initialize board from source data, get space by position

class Board
  attr_accessor :spaces
  def initialize(data)
    # Create spaces from data
    @spaces = data.map { |space_data| 
    case space_data["type"]
      # Future enhancement: Add other space types (chance, community chest, tax, jail, etc) with their own classes inheriting from a base Space class
      when "property"
        Property.new(space_data)
      else
        Space.new(space_data["name"], space_data["type"])
    end }
  end

  def get_space_name(position)
    # Return the space at the given position
    return @spaces[position].name
  end
end