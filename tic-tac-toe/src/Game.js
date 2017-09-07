(function(exports) {
  Game = function(player_one, player_two) {
    this._player_one = player_one;
    this._player_two = player_two;
    this._current_player = player_one;
  };

  Game.prototype = {
    current_player: function(){
      return this._current_player;
    },
    player_one: function(){
      return this._player_one;
    },
    player_two: function(){
      return this._player_two;
    }
  };

  exports.game = Game;
})(this);
