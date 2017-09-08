describe("Board", function() {
  var board;
  var starting_board = [['','',''],['','',''],['','','']];
  var x_value = 1;
  var y_value = 2;
  var invalid_y_value = 3;
  var marker = 'X';

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
      board.attempt_update(x_value, y_value, marker);
      expect(board.check_board).toHaveBeenCalled();
    });
  });

  describe('#check_board', function(){
    it('returns error message if invalid values passed', function() {
      expect(board.check_board(x_value, invalid_y_value, marker)).toEqual('turn invalid');
    });

    it('returns error message if values are valid but space is taken', function() {
      board.update_board(x_value, y_value, marker);
      expect(board.check_board(x_value, y_value, marker)).toEqual('turn invalid');
    });

    it('updates board if values are valid space is free', function() {
      board.update_board(x_value, y_value, marker);
      expect(board._board[x_value][y_value]).toEqual(marker);
    });
  });
});
