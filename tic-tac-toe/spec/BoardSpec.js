describe("Board", function() {
  var board;
  var starting_board = [['','',''],['','',''],['','','']];
  var test_x_value = 1;
  var test_y_value = 2;
  var invalid_y_value = 3;
  var test_marker = 'X';
  var referee = new Referee();

  beforeEach(function() {
    board = new Board(referee);
  });

  describe('#initialize', function(){
    it('starts with a 3 x 3 board populated with empty string elements', function() {
      expect(board.board()).toEqual(starting_board);
    });
  });

  describe('#attempt_update', function(){
    it('calls #check_board', function() {
      spyOn(board, 'check_board');
      board.attempt_update(test_x_value, test_y_value, test_marker);
      expect(board.check_board).toHaveBeenCalled();
    });
  });

  describe('#check_board', function(){
    it('returns error message if invalid values passed', function() {
      expect(board.check_board(test_x_value, invalid_y_value, test_marker)).toEqual('turn invalid');
    });
    
    it('returns error message if values are valid but space is taken', function() {
      board.update_board(test_x_value, test_y_value, test_marker);
      expect(board.check_board(test_x_value, test_y_value, test_marker)).toEqual('turn invalid');
    });

    it('updates board if values are valid space is free', function() {
      board.update_board(test_x_value, test_y_value, test_marker);
      expect(board._board[test_x_value][test_y_value]).toEqual(test_marker);
    });

    it('calls the referee #check_game_status', function() {
      spyOn(board._referee, 'check_game_status');
      board.update_board(test_x_value, test_y_value, test_marker);
      expect(board._referee.check_game_status).toHaveBeenCalled();
    });
  });
});
