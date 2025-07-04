class Board

  @knight_moves = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]]

  def possible_moves(x,y)
    retorno = []
    @knight_moves.each do |move|
      if (0..8).include?(x + move[0]) && (0..8).include?(x + move[1])
       retorno << move
      end
    end
    retorno
  end

  def knight_moves(initial_pos, final_pos)
    return 
  end
end