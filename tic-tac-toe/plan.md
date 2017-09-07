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

Player
Board
Game
Referee
