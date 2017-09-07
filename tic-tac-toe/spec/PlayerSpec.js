describe("Player", function() {
  var player_one;

  beforeEach(function() {
    player_one = new Player('X');
  });

  it("should be able to create a player with a marker", function() {
    expect(player_one.marker()).toEqual('X');
  });
});
