class Player

   
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        response = gets.chomp #"4 7"
        ans = response.split(" ") #["4", "7"]
        return ans.map! { |char| char.to_i}
    end
end
