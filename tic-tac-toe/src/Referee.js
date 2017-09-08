(function(exports){
  Referee = function(){
  };

  Referee.prototype = {
    check_game_status: function(){
      return true;
    }
  };
  exports.referee = Referee;
})(this);
