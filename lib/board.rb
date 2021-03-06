class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} " 
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
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
    position(num) != " "
  end

  def valid_move?(num)
    num.to_i.between?(1,9) && !taken?(num)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end