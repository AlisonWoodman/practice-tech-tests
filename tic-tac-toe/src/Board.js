(function(exports) {
  Board = function(referee) {
    this._board = [['','',''],['','',''],['','','']];
    this._referee = new Referee();
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
        this._update_board();
      }
      else return 'turn invalid';
    },
    referee: function(){
      return this._referee;
    },
    update_board: function(x, y, marker){
      this._board[x][y] = marker;
      this._referee.check_game_status();
    }
  };

  exports.Board = Board;
})(this);
