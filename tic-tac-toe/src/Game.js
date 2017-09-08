(function(exports) {
  Game = function(player_one, player_two, board, turn_validator, referee) {
    this._player_one = player_one;
    this._player_two = player_two;
    this._current_player = player_one;
    this._board = board;
    this._turn_validator = turn_validator;
    this._referee = new Referee();
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
    turn_validator: function() {
      return this._turn_validator;
    },
    turn: function() {
      return this._turn;
    },
    play: function(x, y) {
      marker = this._current_player._marker;
      board = this._board;
      if (this._turn_validator.validate_turn(x, y, board)) {
        this._board.update_board(x, y, marker);
        this.switch_players();
        this._referee.check_game_status(x, y, marker);
      }
    },
    switch_players: function(){
      if (this._current_player === this._player_one) {
        this._current_player = this._player_two;
      }
      else this.current_player = this._player_one;
    }
  };

  exports.game = Game;
})(this);
