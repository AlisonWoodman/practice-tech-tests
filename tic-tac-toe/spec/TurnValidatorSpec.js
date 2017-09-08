describe("TurnValidator", function() {
  var turn_validator = new TurnValidator();
  var x_value = 1;
  var y_value = 2;
  var invalid_y_value = 3;
  var board = new Board();

  describe("#validate_turn", function(){
    it("returns true if turn is valid", function() {
      expect(turn_validator.validate_turn(x_value, y_value, board)).toEqual(true);
    });
    it("returns if turn is invalid", function() {
      expect(turn_validator.validate_turn(x_value, invalid_y_value, board)).toEqual(false);
    });
  });
});
