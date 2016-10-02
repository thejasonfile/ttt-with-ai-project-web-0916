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

  #could not get 3 arguments to work, but 3 standard arguments does work
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
      draw? || won?
  end

  def won?
    WIN_COMBINATIONS.map {|combo| combo.map {|num| board.position(num)} }.include?(["X", "X", "X"]) ||
    WIN_COMBINATIONS.map {|combo| combo.map {|num| board.position(num)} }.include?(["O", "O", "O"])  
  end

  def draw?
    @board.full? && !won?
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

  #how does current_player.move(@board) return "1"?
  def turn
    # a move is a player providing input
    move = current_player.move(@board)
    # if the move is invalid, ask for input again
    if !@board.valid_move?(move)
      turn
    else
      # if the move is valid, then update the board which changes the player
      @board.update(move, current_player)
    end
  end

  def play
    #check if game is over on every turn
    while !over?
      #asks for players input on every turn
      turn
    end
    if won?
      #congratulate the winnner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end











end

