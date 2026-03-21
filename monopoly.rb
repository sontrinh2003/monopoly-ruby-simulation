=begin

Monopoly Game: A simplified version of the Monopoly board game in Ruby.

Features:
- Players can move around the board, buy properties, and pay rent.
- The game ends when one player goes bankrupt.

RULES
- Players start with $16 and position 0
- Players take turns rolling a dice (1-6) and moving forward
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

require 'json'
require_relative 'board'
require_relative 'player'
require_relative 'property'

class MonopolyGame
	attr_accessor :players, :board, :roll_data

	def initialize(players, board, roll_data)
		@players = players
		@board = board
		@roll_data = roll_data
	end

	def play
		# Implement game logic: roll dice, move player, handle landing on spaces
		# Loop through players and rolls until a player goes bankrupt, then determine the winner
		@board.spaces.each do |space|
			puts space
		end
		@roll_data.each do |roll|
			puts roll
		end
	end
end

def main
	# Initialize board and players, then start the game
	
	# Load board data from file, create Board object
	print "Enter the file name of the Monopoly board: "
  board_file = gets.chomp
	while File.exist?(board_file) == false || File.extname(board_file) != ".json"
		puts "File not exists or invalid."
		print "Enter the file name of the Monopoly board: "
		board_file = gets.chomp
	end
	board_data = JSON.parse(File.read(board_file))
	board = Board.new(board_data)

	# Load roll data from file
	print "Enter the file name of dice rolls data: "
	roll_file = gets.chomp
	while File.exist?(roll_file) == false	|| File.extname(roll_file) != ".json"
		puts "File not exists or invalid."
		print "Enter the file name of dice rolls data: "
		roll_file = gets.chomp
	end
	roll_data = JSON.parse(File.read(roll_file))

	# Create players
	players = [
		Player.new("Peter"),
		Player.new("Billy"),
		Player.new("Charlotte"),
		Player.new("Sweedal")
	]

	# Create game instance and start playing
	game = MonopolyGame.new(players, board, roll_data)
	game.play
end

main()