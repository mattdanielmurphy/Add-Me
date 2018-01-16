require './questions'
require './players'

class Game
	attr_reader :range

	def initialize(range = 1...20)
		@range = range
	end
end
