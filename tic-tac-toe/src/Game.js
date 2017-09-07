(function(exports) {
  Game = function(player_one, player_two, board) {
    this._player_one = player_one;
    this._player_two = player_two;
    this._current_player = player_one;
    this._board = board;
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
    },
    board: function() {
      return this._board;
    },
    play: function(x, y) {
      marker = this._current_player._marker;
      this._board.attempt_update(x, y, marker);
    }
  };

  exports.game = Game;
})(this);
