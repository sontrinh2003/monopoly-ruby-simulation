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
- Rent is doubled if the owner has all properties of that color

=end

require 'json'
require_relative 'board'
require_relative 'space'
require_relative 'player'
require_relative 'property'

class MonopolyGame

	def initialize(players, board, roll_data)
		@players = players
		@board = board
		@roll_data = roll_data
	end

	def play
		# Implement game logic: roll dice, move player, handle landing on spaces
		# Loop through players and rolls until a player goes bankrupt, then determine the winner
		
		roll_index = 0

		while @players.all? { |player| !player.bankrupcy }
			@players.each do |player|
				break if player.bankrupcy || roll_index >= @roll_data.length

				# Get the current roll for the player
				step = @roll_data[roll_index]
				player.move(step, @board.spaces.length)

				# Get the space the player landed on
				space = @board.spaces[player.pos]

				# DEBUG ONLY: Print the turn details
				# puts "\n"
				# puts "Turn #{roll_index}: #{player.name} rolls #{step} and lands on #{space.name}"

				if space.is_a?(Property)
					if space.owner.nil?
						# Unowned property, player must buy it
						player.buy_property(space)

						# DEBUG ONLY: Print the buy details
						# puts "#{player.name} buys #{space.name} for $#{space.price}. Remaining money: $#{player.money}"
					elsif space.owner == player
						# Owned by the player, nothing happens
						# Future enhancements: Allow player to add houses/hotels for extra rent
						
						# DEBUG ONLY: Print the owned details
						# puts "#{player.name} owns #{space.name}. No action taken."
					else 
						# Owned by another player, pay rent
						full_set_owned = owns_full_set?(space.owner, space.color)
						player.pay_rent(space, full_set_owned)

						# DEBUG ONLY: Print the rent details
						# puts "#{player.name} pays rent to #{space.owner.name} for #{space.name}. Remaining money: $#{player.money}"
						# puts "#{space.owner.name} receives rent. Total money: $#{space.owner.money}"
					end
				end

				roll_index += 1
			end
		end

		output_results

	end

	def owns_full_set?(owner, color)
		properties = @board.spaces.select { |s| s.is_a?(Property) && s.color == color }
		return properties.all? { |p| p.owner == owner }
	end

	def output_results
		# Output final results: winner and player statuses

	end
end

def main
	# Initialize board and players, then start the game
	
	# Load board data from file, create Board object
	board_data = JSON.parse(File.read("board.json"))
	board = Board.new(board_data)

	# Load roll data from file
	print "Enter the filename of dice rolls data: "
	roll_file = gets.chomp
	while File.exist?(roll_file) == false	|| File.extname(roll_file) != ".json"
		puts "File not exists or invalid."
		print "Enter the filename of dice rolls data: "
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