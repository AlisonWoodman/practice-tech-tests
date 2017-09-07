(function(exports) {
  Board = function() {
    this._board = [['','',''],['','',''],['','','']];
  };

  Board.prototype = {
    board: function(){
      return this._board;
    },
    attempt_update: function(){
      return 'hi';
    }
  };

  exports.Board = Board;
})(this);
