class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(input)
        ui = input.to_i 
        ui -= 1
    end
    def move(index, token = "X")
        @board[index] = token
    end
    def position_taken?(index)
        @board[index] == " " ? false : true
    end
    def valid_move?(index)
        !position_taken?(index) && index >=0 && index <= 8
    end
    def turn_count
        count = 0
        @board.each_with_index do |cell, index|
            position_taken?(index) && count += 1
        end
        return count
    end
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    def turn
        puts "take your turn"
        user_input = gets
        index = input_to_index(user_input)
        if(valid_move?(index))
            move(index, current_player)
            display_board
        else
            turn
        end
    end
    def won?
        result = nil
        WIN_COMBINATIONS.each do |combo|
           won = (@board[combo[0]] != " ") && 
            (@board[combo[0]] == @board[combo[1]]) && 
            (@board[combo[1]] == @board[combo[2]]) 
         if won
            result = combo
            break
        end
    end
    result      
    end
    def full?
       turn_count >= 9 && !won? ? true : false
    end
    def draw?
        full?
    end
    def over?
        draw? || won? 
    end
    def winner
        if won?
            current_player === "X" ? "O" : "X"
        end
    end
    def play
        until over?
            self.turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end