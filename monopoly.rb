=begin

Monopoly Game: A simplified version of the Monopoly board game in Ruby.

Features:
- Players can move around the board, buy properties, and pay rent.
- The game ends when one player goes bankrupt.

RULES
- Players start with $16 and position 0
- Players take turns rolling a die (1-6) and moving forward
- When passing GO (position 0), players receive $1, but not on their first move
- The game ends when a player goes bankrupt (money < 0)
- The winner is the player with the most money at the end of the game

Land on a space:
- If a player lands on an unowned property, they must buy it
- If a player lands on an owned property, they must pay rent to the owner

Rent:
- Rent is equal to the property's price
- Rent isdoubled if the owner has all properties of that color

=end

class MonopolyGame
	attr_accessor :players, :board, :roll_data

	def initialize(players, board)
		@players = players
		@board = board
		@roll_data = []
	end

	def play
		# Implement game logic: roll die, move player, handle landing on spaces
	end
end