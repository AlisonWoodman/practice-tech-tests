describe('Game', function(){
  var game;
  var test_player_one = new Player('X');
  var test_player_two = new Player('O');
  var test_board = new Board;
  var test_x_value = 1;
  var test_y_value = 2;


  beforeEach(function() {
    game = new Game(test_player_one, test_player_two, test_board);
  });

  describe('initialization', function(){
    it('current player on init is player one', function(){
      expect(game.current_player()).toEqual(test_player_one);
    });

    it('starts with two players', function(){
      expect(game.player_one()).toEqual(test_player_one);
      expect(game.player_two()).toEqual(test_player_two);
    });

    it('starts with a board', function(){
      expect(game.board()).toEqual(test_board);
    });
  });

  describe('play', function(){
    it('calls board method to attempt an update', function(){
      spyOn(test_board, 'attempt_update');
      game.play(test_x_value, test_y_value);
      expect(test_board.attempt_update).toHaveBeenCalled();
    });
  });
});
