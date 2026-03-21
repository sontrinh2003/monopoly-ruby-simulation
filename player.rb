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
end