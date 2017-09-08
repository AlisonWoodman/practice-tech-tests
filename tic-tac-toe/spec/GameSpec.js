describe('Game', function(){
  var game;
  var player_one = new Player('X');
  var player_two = new Player('O');
  var referee = new Referee();
  var board = new Board();
  var x_value = 1;
  var y_value = 2;


  beforeEach(function() {
    game = new Game(player_one, player_two, board);
  });

  describe('initialization', function(){
    it('current player on init is player one', function(){
      expect(game.current_player()).toEqual(player_one);
    });

    it('starts with two players', function(){
      expect(game.player_one()).toEqual(player_one);
      expect(game.player_two()).toEqual(player_two);
    });

    it('starts with a board', function(){
      expect(game.board()).toEqual(board);
    });

  });

  describe('#play', function(){
    it('calls board method to attempt an update', function(){
      spyOn(board, 'attempt_update');
      game.play(x_value, y_value);
      expect(board.attempt_update).toHaveBeenCalled();
    });
    it('switches current player if play is valid', function(){
      game.play(x_value, y_value);
      expect(game._current_player).toEqual(player_two);
    });
    it('increments turn if play is valid', function(){
      game.play(x_value, y_value);
      expect(game._turn).toEqual(2);
    });
    it('calls the referee #check_game_status', function() {
      spyOn(game._referee, 'check_game_status');
      game.play(x_value, y_value);
      expect(game._referee.check_game_status).toHaveBeenCalled();
    });
  });
});
