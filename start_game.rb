require './Game'

def start_game(min=1, max=20)
	turn = Game.new(min...max) if max > min
	puts "Starting a new game with range #{min}-#{max}..."
end