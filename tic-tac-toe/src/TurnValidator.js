(function(exports) {
  TurnValidator = function(){
  };

  TurnValidator.prototype = {
    validate_turn: function(x, y, board){
      if (board._board[x][y] === '') {
        return true;
      }
      else return false;
    },
  };
  exports.TurnValidator = TurnValidator;
})(this);
