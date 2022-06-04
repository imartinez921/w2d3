require_relative "./human_player.rb" #require_relative only takes 1 argument
require_relative "./board.rb"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = Human_player.new(player_1_mark) #these should not have @
        @player_2 = Human_player.new(player_2_mark)
        @board = Board.new

        @current_player = @player_1 #this starts with the default player1
    end


    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end


    def play
        while board.empty_positions?
            board.print
            pair = human_player.get_position
            board.place_mark(pair,@current_player.mark)
            if board.win?(@current_player.mark)
                print "VICTORY TO #{@current_player}"
                return
            else switch_turn
            end
        end

        print "THIS IS A DRAW. OH WELLS"
    end



end