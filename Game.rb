require './Question_generator'
require './players'

class Game
	attr_reader :range, :swap_current_player

	def initialize(range_min=1, range_max=20)
		@range = range_min...range_max
		puts "Game initialized with range #{range_min} to #{range_max}."
		@p1 = Player.new
		@p2 = Player.new
		@p2.name = 'Player 2'
		@q = Question_generator.new
		turn()
	end

	def swap_current_player
		if @current_player == @p1
			@current_player = @p2
			@other_player = @p1
		else
			@current_player = @p1
			@other_player = @p2
		end
	end

	def turn
		swap_current_player
		question = @q.new_question
		question_string = question[:string]
		@answer = question[:result]
		puts '---- NEW TURN ----'
		puts "#{@current_player.name}: #{question_string}"
		input = gets.chomp
		if input.to_i == @answer
			puts 'Correct!'
			turn()
		else
			puts "Incorrect! (Answer was #{@answer}.)"
			@current_player.lives -= 1
			if @current_player.lives > 0
				puts "#{@current_player.name}: #{@current_player.lives}/3 vs. #{@other_player.name}: #{@other_player.lives}/3"
				turn()
			else
				game_over
			end
		end
	end

	def game_over
		puts '---- GAME OVER ----'
		swap_current_player
		puts "#{@current_player.name} wins with a score of #{@current_player.lives}."
		puts "Play again? [enter]"
		Game.new if gets.chomp == ''
	end
end
