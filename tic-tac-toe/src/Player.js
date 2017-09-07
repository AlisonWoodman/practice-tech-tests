(function(exports) {
  function Player(marker) {
    this._marker = marker;
  }

  Player.prototype = {
    marker: function() {
      return this._marker;
    }
  };
  exports.Player = Player;
})(this);
