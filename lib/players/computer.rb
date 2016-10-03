module Players
  
  class Computer < Player

    def move(board)
      num = rand(0..8)
      if board.valid_move?(num)
      end
      num.to_s
    end

  end
end
