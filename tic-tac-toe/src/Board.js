(function(exports) {
  Board = function(){
    this._board = [['','',''],['','',''],['','','']];
  };

  Board.prototype = {
    board: function(){
      return this._board;
    },
    attempt_update: function(x, y, marker){
      this.check_board(x, y, marker);
    },
    check_board: function(x, y, marker){
      if (this._board[x][y] == '') {
        this.update_board(x, y, marker);
      }
      else return 'turn invalid';
    },
    turn: function(){
      return this._turn;
    },
    update_board: function(x, y, marker){
      this._board[x][y] = marker;
    },
  };

  exports.Board = Board;
})(this);
