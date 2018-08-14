class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #left_column_win
    [1,4,7], #middle_column_win
    [2,5,8], #right_column_win
    [0,4,8], #diagonal_LtoR_win
    [2,4,6], #diagonal_RtoL_win
  ]

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

 def input_to_index(user_input)
   user_input.to_i - 1
 end

 def move(board, index, player)
   board[index] = player
 end

 def position_taken?(board, index)
   !(board[index].nil? || board[index] == " ")
 end

 def valid_move?(board, index)
   index.between?(0,8) && !position_taken?(board, index)
 end

 def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(board, index)
     move(board, index, current_player(board))
     display_board(board)
   else
     turn(board)
   end
 end

 def turn_count(board)
   counter = 0
   board.each do |player|
     if player == "X" || player == "O"
       counter +=1
     end
   end
   return counter
 end
 def current_player(board)
   turn_count(board).even? == true ? "X" : "O"
 end
  

end
