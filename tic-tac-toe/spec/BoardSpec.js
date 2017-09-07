describe("Board", function() {
  var board;
  var starting_board = [['','',''],['','',''],['','','']];
  var test_x_value = 1;
  var test_y_value = 2;
  var invalid_y_value = 3;
  var test_marker = 'X';

  beforeEach(function() {
    board = new Board();
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
    it('returns error message if space is taken', function() {
      board.update_board(test_x_value, test_y_value, test_marker);
      expect(board.check_board(test_x_value, test_y_value, test_marker)).toEqual('turn invalid');
    });
  });
});
