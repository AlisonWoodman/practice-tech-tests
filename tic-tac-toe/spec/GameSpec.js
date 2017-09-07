describe('Game', function(){
  var game;
  var test_player_one = new Player('X');
  var test_player_two = new Player('O');


  beforeEach(function() {
    game = new Game(test_player_one, test_player_two);
  });

  describe('initialization', function(){ 
    it('current player on init is player one', function(){
      expect(game.current_player()).toEqual(test_player_one);
    });

    it('starts with two players', function(){
      expect(game.player_one()).toEqual(test_player_one);
      expect(game.player_two()).toEqual(test_player_two);
    });
  });
});
