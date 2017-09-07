(function(exports) {
  Board = function() {
    this._board = [['','',''],['','',''],['','','']];
  };

  Board.prototype = {
    board: function(){
      return this._board;
    }
  };

  exports.Board = Board;
})(this);
