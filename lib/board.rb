class Board

  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def reset!
    @cells = []
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} " 
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(num)
    @cells.at(num.to_i-1)
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    cells.select { |cell| cell == "O" || cell == "X" }.count
  end

  def taken?(num)
    
  end


end