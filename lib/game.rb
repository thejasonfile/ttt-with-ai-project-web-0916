class Game

  attr_accessor :board, :player_1, :player_2, :current_player

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
      if draw? || won?
        true
      else
        false
      end
  end

  def won?
    WIN_COMBINATIONS.map {|combo| combo.map {|num| board.position(num)} }.include?(["X", "X", "X"]) || 
    WIN_COMBINATIONS.map {|combo| combo.map {|num| board.position(num)} }.include?(["O", "O", "O"])  
  end

  def draw?
    if won?
      false
    elsif @board.full?
      true
    else
      false
    end
  end

  def winner
    if WIN_COMBINATIONS.map {|combo| combo.map {|num| board.position(num)} }.include?(["X", "X", "X"])
      "X"
    elsif WIN_COMBINATIONS.map {|combo| combo.map {|num| board.position(num)} }.include?(["O", "O", "O"])  
      "O"
    else
      nil
    end
  end

  def turn
    
  end






end

