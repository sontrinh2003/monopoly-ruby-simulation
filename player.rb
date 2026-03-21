# Class Player: Manage player status
# Attributes: name, money, position, properties owned, bankruptcy status
# Methods: Initialize player, update money, move position, buy property, pay rent, check bankruptcy

class Player
	attr_accessor :name, :money, :pos, :properties, :bankrupcy

	def initialize(name)
		@name = name
		@money = 16
		@pos = 0
		@properties = []
		@bankrupcy = false
		@first_move = true
	end

  def move(steps, board_size)
    # Move player position and handle passing GO
    old_pos = @pos
    @pos = (@pos + steps) % board_size
    
    if !@first_move && @pos < old_pos
      # Passed GO, receive $1
      @money += 1
    end
    
    @first_move = false
  end

  def buy_property(property)
    # Buy property if player has enough money
    if @money >= property.price
      @money -= property.price
      @properties << property
      property.owner = self
    else
      # Not enough money to buy property, player goes bankrupt
      go_bankrupt
    end
  end

  def pay_rent(property, full_set_owned)
    # Pay rent to property owner
    rent = property.price
    if full_set_owned
      rent *= 2 # Rent is doubled if owner has all properties of that color
    end

    if @money >= rent
      @money -= rent
      property.owner.money += rent
    else
      # Not enough money to pay rent, player goes bankrupt
      go_bankrupt
    end
  end

  def go_bankrupt
    @money = 0
    @bankrupcy = true
    
    # Potential: reset properties to unowned
    
  end
end