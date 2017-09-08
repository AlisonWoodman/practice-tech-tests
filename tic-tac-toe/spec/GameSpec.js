describe('Game', function(){
  var game;
  var player_one = new Player('X');
  var player_two = new Player('O');
  var referee = new Referee();
  var board = new Board();
  var turn_validator = new TurnValidator
  var x_value = 1;
  var y_value = 2;


  beforeEach(function() {
    game = new Game(player_one, player_two, board, turn_validator, referee);
  });

  describe('initialization', function(){
    it('current player on init is player one', function(){
      expect(game.current_player()).toEqual(player_one);
    });

    it('starts with two players', function(){
      expect(game.player_one()).toEqual(player_one);
      expect(game.player_two()).toEqual(player_two);
    });
  });

  describe('#play', function(){
    it('calls board method to attempt an update', function(){
      spyOn(turn_validator, 'validate_turn');
      game.play(x_value, y_value);
      expect(game._turn_validator.validate_turn).toHaveBeenCalled();
    });
    it('switches current player if play is valid', function(){
      game.play(x_value, y_value);
      expect(game._current_player).toEqual(player_two);
    });
    it('calls the referee #check_game_status', function() {
      spyOn(board, 'update_board');
      game.play(x_value, y_value);
      expect(game._board.update_board).toHaveBeenCalled();
    });
  });
});
