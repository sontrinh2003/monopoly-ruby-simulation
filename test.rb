require 'json'

board_file = gets.chomp
while File.exist?(board_file) == false
  puts "File not exists."
  print "Enter the file name of the Monopoly board: "
  board_file = gets.chomp
end
board_data = JSON.parse(File.read(board_file))
puts board_data