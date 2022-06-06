require_relative "./board.rb" #. is the same directory, / is the filename
require_relative "./player.rb"

# class Battleship
#     attr_reader :player, :board #don't forget comma between attribute tags

#     def initialize(n)
#         @player = Player.new

#         @board = Board.new(n) #@board refers to a specific instance
#             # All these instances refer to the other page methods with a .methodname
#             # because they belong to that class

#         @remaining_misses = board.size/2
#     end

#     def start_game
#         board.place_random_ships
#         puts board.num_ships
#         board.print
#     end

#     def lose?
#         if @remaining_misses <= 0
#             puts "You lose!"
#             return true
#         else
#             puts board.num_ships
#             return false
#         end
#     end

#     def win?
#         puts board.num_ships
#         if board.num_ships > 0
#             return false
#         else
#             puts "You win!"
#             return true
#         end
#     end

#     def game_over?
#         #can use self. here when referring to instance method defined in same class function
#         if win? || lose?
#             return true
#         else
#             return false
#         end
#     end

#     def turn
#         move = player.get_move 
#         # board.attack(move) #This line couldn't be here! WHY. Have to call the attack.
#         board.print
#         if !board.attack(move) 
#             print @remaining_misses -= 1
#         end
#     end



# end

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new

        @board = Board.new(n)

        @remaining_misses = @board.size/2

    end

    def start_game
        board.place_random_ships
        puts board.num_ships
        board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            @remaining_misses > 0
            return false
        end
    end

    def win?
        if board.num_ships == 0
            puts "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else 
            return false
        end
    end

    def turn
        if !board.attack(@player.get_move) #if attack returns false
            puts @remaining_misses -= 1 
        else 
            puts @remaining_misses
        end
        board.print
    end


end