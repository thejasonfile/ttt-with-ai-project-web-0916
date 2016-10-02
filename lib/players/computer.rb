module Players
  
  class Computer < Player

    def move(board)
      board.valid_move?('1')
    end

  end
end
