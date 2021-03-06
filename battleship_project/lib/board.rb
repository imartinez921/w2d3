# class Board
 
#     attr_reader :size

#     def initialize(n)
#             #Array.new(number of elements, default element)
#             #block becomes the 2nd optional arg
#         @grid = Array.new(n){ Array.new(n, :N)} #@grid refers to a specific instance

#         @size = n * n

#         @remaining_misses = @size/2
#     end

#     def [](pair) #[4,5] is a position [row = 4, col = 5] #get spot
#         #y,x = pair = [4,5]
#         y,x = pair[0], pair[1]
#         @grid[y][x] # this needs to be @grid, cannot be Self or else stuck in loop
#     end

#     def []=(pair,val) #[4,5] & value # modify spot to value
#         #row, col = pos
#         y, x = pair[0], pair[1]
#         @grid[y][x] = val # this needs to be @grid, cannot be Self or else stuck in loop
#     end

#     def num_ships
#         count = 0
#         @grid.each do |subarray| #had to be @grid
#             subarray.each do |spot|
#                 count += 1 if spot == :S
#             end
#         end
#         return count
#     end

#     def attack(pair) 
#             #after we have defined bracket function, it should be self every time we use brackets
#         if self[pair] == :S 
#             self[pair] = :H
#             puts "You sunk my battleship!"
#             return true
#         else
#             self[pair] = :X
#             return false
#         end
#     end


    # def place_random_ships
    #     max = self.size * 0.25 #had to be self for instance
    #     while self.num_ships < max #had to be self for instance
    #         x = rand(0...@grid[0].length) #spec says @grid
    #         y = rand(0...@grid.length)
    #         pair = [x,y]
    #         self[pair] = :S 
    #     end
    # end

#     def hidden_ships_grid
#         @grid.map do |subarray|
#             subarray.map do |ele|
#                 ele == :S ? :N : ele
#             end
#         end
#     end

#     def Board.print_grid(arrayArr) # :: denotes class method, so called on class itself; here self. also works (only when defining it in the class function)
#         arrayArr.each do |subarray| #class methods cannot be written with any instance attributes
#             puts subarray.join(" ") #this had to be puts
#         end
#     end
            
#     def cheat
#         Board.print_grid(@grid)
#     end

#     def print
#         Board.print_grid(hidden_ships_grid)
#     end

# end


class Board
    attr_reader :size

    def initialize(n)

        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](pair)
        return @grid[pair[0]][pair[1]]
    end

    def []=(pair, value)
        y, x = pair
        @grid[y][x] = value
    end

    def num_ships
        @grid.inject(0) {|acc, subarray| acc += subarray.count(:S)}
        # count = 0
        # @grid.each do |subarray|
        #     count += subarray.count(:S)
        # end
        # return count
    end

    def attack(pair)
        if self[pair] == :S
            self[pair]= :H 
            puts "you sunk my battleship!"
            return true
        else
            self[pair]= :X 
            return false
        end
    end

    def place_random_ships #could also call num_ships to count ships!
        randomSize = self.size * 0.25
        while num_ships < randomSize #had to be less than, not <=
            y = rand(0...@grid.length)
            x = rand(0...@grid[0].length)
            #beware we made a bracket= method that breaks our code if we try to index normally!
            # self[y][x]= :S #THIS DOESN'T WORK
            @grid[y][x] = :S
            # pair = [y,x] #[]= method takes an array arg
        end
    end

    def hidden_ships_grid
        @grid.map do |subarray|
            subarray.map do |ele|
                ele == :S ? ele = :N : ele
            end
        end
    end

    def Board.print_grid(array) #.JOIN IS YOUR FRIEND!!!, don't forget to use argument
        array.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid) #this had to be self
    end


end