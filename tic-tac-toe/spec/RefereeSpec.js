describe("Referee", function() {
  var referee = new Referee();
  var x_value = 1;
  var y_value = 2;
  var marker = 'X';

  describe("#check_game_status", function(){
    it("adds incoming coordinates to correct coordinates array", function() {
      referee.check_game_status(x_value, y_value, marker);
      expect(referee._X_coordinates).toEqual([[x_value, y_value]]);
    });
  });
});
