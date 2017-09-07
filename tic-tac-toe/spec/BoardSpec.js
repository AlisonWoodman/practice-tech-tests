describe("Board", function() {
  var board;
  var starting_board = [['','',''],['','',''],['','','']];

  beforeEach(function() {
    board = new Board();
  });

  it('starts with a 3 x 3 board populated with empty string elements', function() {
    expect(board.board()).toEqual(starting_board);
  });
});
