# Monopoly Board: Manage the board and its spaces
# Spaces: Array of Property objects, indexed by position on the board
# Methods: Initialize board from source data, get space by position

class Board
  attr_accessor :spaces
  def initialize(data)
    # Create spaces from data
    @spaces = data.map { |space_data| space_data["type"] == "property" ? Property.new(space_data) : space_data }
  end

  def get_space(position)
    # Return the space at the given position
    return @spaces[position]
  end
end