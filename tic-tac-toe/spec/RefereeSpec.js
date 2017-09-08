describe("Referee", function() {
  var referee = new Referee()

  describe("#check_game_status", function(){
    it("exists", function() {
      expect(referee.check_game_status()).toEqual(true);
    });
  });
});
