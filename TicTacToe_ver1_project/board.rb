# class Board
#     attr_accessor :board

#     def initialize
#         @grid = Array.new(3){Array.new(3, "_")}
#     end

#     def [](pair) # [1,3]
#         y, x = pair[0], pair[1]
#         @grid[y][x]
#     end

#     def []=(pair,val) # [1,3], :X
#         y,x = pair
#         @grid[y][x] = val
#     end
        

#     def valid?(pair)
#         return false if pair.any? {|ele| ele.negative?}
#         if self[pair] == nil
#             return false
#         else return true
#         end
#     end

#     def empty?(pair)
#         self[pair] == "_" ? true : false
#     end

#     def place_mark(pair,mark)
#         if valid?(pair) && empty?(pair)
#             self[pair] = mark
#         else
#             raise "cannot mark right here!"
#         end
#     end

#     def print
#         @grid.each do |row|
#             puts row.join(" ")
#         end
#     end

#     # def win_row?(mark) #checking entirety of subarray
#     #     @grid.each do |row|
#     #         return true if row.all? {|ele| ele == mark}
#     #     end
#     #     return false
#     # end

#     # def win_col?(mark) #checking each subarray at the same y
#     #     i = 0
#     #     while i < grid[0].length
#     #         collection = grid.map do |subarray|
#     #         subarray[i]
#     #         end
    
#     #         return true if collection.all? {|ele| ele == mark}
#     #     i += 1
#     #     end
#     #     return false
#     # end

#     # def win_diagonal?(mark) 
#     #     y = 0
#     #     while y < @grid.length #checks each y axis and pulls something at the xindex
#     #         x = 0
#     #         collection = []
#     #         while x < @grid[0].length
#     #         collection << @grid[y][x]
#     #         x += 1
#     #         y += 1
#     #         end
    
#     #         return true if collection.all? {|ele| ele == mark}
#     #     end
        
#     #     y = 0
#     #     while y < @grid.length
#     #         x = 2
#     #         collection = []
#     #         while x >= 0
#     #         collection << @grid[y][x]
#     #         y += 1
#     #         x -= 1
#     #         end
    
#     #         return true if collection.all? {|ele| ele == mark}
#     #     end
#     #     return false
#     # end


#     def win_row?(mark)
#         @grid.any? do |subarray|
#             subarray.all? do |ele|
#                 ele == mark
#             end
#         end
#     end

#     def win_col?(mark)
#         (0...@grid[0].length).each do |i|
#             collection = []
#             @grid.each do |subarray|
#                 collection << subarray[i]
#             end
#         return true if collection.all? {|ele| ele == mark}
#         end
#         return false
#     end


    # def win_diagonal?(mark)
    #     collection = []
    #     (0...@grid.length).each do |i| #[0][0], [1][1]
    #         (0...@grid.length).each do |j|
    #         collection << @grid[i][j]
    #         end
    #     return true if collection.all? {|ele| ele == mark}
    #     end
    
    #     collection = []
    #     (0...@grid.length).each do |i| #[2][0], [1][1], [0][2]
    #         (0...@grid.length).reverse_each do |j|
    #             collection << @grid[i][j]
    #         end
    #     return true if collection.all? {|ele| ele == mark}
    #     end
    #     return false
    # end

#     def win?(mark)
#         return true if win_col?(mark)
#         return true if win_row?(mark)
#         return true if win_diagonal?(mark)
#         return false
#     end

#     def empty_positions?
#         @grid.flatten.any? {|ele| ele == "_"}
#     end

# end





class Board



end


# b.place_mark([0, 2], :D)
# b.place_mark([1, 1], :D)
# b.place_mark([2, 0], :D)

# b =
# [[:D, :X, :X],
# [:D, :t, "_"],
# [:D, "_", :D]]


# b = [[:C, "_", :D], ["_", :D, "_"], [:D, "_", :C]]
# p win_diagonal?(:D, b)
