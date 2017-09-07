board = [['','',''],
         ['','',''],
         ['','','']]

players(marker)
game - let's players take turns, keeps track of current player

Flow:
Player one's turn:
1) inputs x and y value to choose space
2) board checks whether board[x][y] == ''. If it does:
  a) board replaces value with X
  b) if it does, player one adds [x,y] to array of claimed spaces
  c) referee checks whether winning conditions are met, and if not, whether all spaces are taken. Game ends if either are true
If it doesn't:
a) loop back to the start of Player one's turn, until valid space selected
3) Current player swithces to player two

Classes:
Game:
- initializes with two players, one of them the current player, and a board
- allows players to take turns and switches current_player after successful turn
- calls board method to check whether move is valid
Player:
- initializes with marker
Board:
- initializes with board array
- checks whether move (sent from game) is valid
- updates board array with X's and O's if move is valid
Referee: checks winning or drawing conditions and ends game if appropriate
