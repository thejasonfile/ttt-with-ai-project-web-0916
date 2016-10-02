class Board

  attr_accessor :cells, :display

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
    if num.class == String
      num = num.to_i - 1
    end
    @cells.at(num)
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    cells.select { |cell| cell == "O" || cell == "X" }.count
  end

  def taken?(num)
    @cells[num.to_i-1] == "X" || @cells[num.to_i-1] == "O"
  end

  def valid_move?(num)
    (1..9).to_a.include?(num.to_i) && !taken?(num)
  end

  def update(num, player)
    @cells[num.to_i - 1] = player.token
  end

end