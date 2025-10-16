class Board
  require './node.rb'
  require 'set'

  KNIGHT_STEP = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]] 

  def knight_moves(start_pos, final_pos)
    if out_of_bounds?(start_pos) || out_of_bounds?(final_pos)
      puts "error en el ingreso de coordenadas, intente nuevamente" 
      return nil
    end
    shortest_path(start_pos, final_pos)
  end

  def shortest_path(start_pos, final_pos)
    to_visit = [Node.new(start_pos)]
    visited = Set.new
    while to_visit.any?
      current_node = to_visit.shift
      visited.add(current_node.pos)
      break if current_node.pos == final_pos
      KNIGHT_STEP.each do |move|
        next_move = sum_coords(current_node.pos, move)
        next if out_of_bounds?(next_move) || visited.include?(next_move)
        to_visit << Node.new(next_move, current_node)
      end
    end
    result = []
    while current_node
      result << current_node.pos
      current_node = current_node.last_node
    end
    result.reverse
  end

  def out_of_bounds?(coords)
    coords[0] < 0 || coords[0] > 7 || coords[1] < 0 || coords[1] > 7
  end

  def sum_coords(last_position, move)
    [last_position[0] + move[0], last_position[1] + move[1]]
  end

end