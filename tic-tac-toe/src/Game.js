(function(exports) {
  Game = function(player_one, player_two, board, referee) {
    this._player_one = player_one;
    this._player_two = player_two;
    this._current_player = player_one;
    this._board = board;
    this._turn = 1;
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
    board: function() {
      return this._board;
    },
    turn: function() {
      return this._turn;
    },
    play: function(x, y) {
      marker = this._current_player._marker;
      this._board.attempt_update(x, y, marker);
      this.choose_next_steps();
    },
    choose_next_steps: function() {
      if (this._turn < this._board._turn) {
        this.switch_players();
        this.increment_turn();
        this._referee.check_game_status();
      }
    },
    increment_turn: function(){
      this._turn ++;
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
