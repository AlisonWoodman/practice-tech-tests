(function(exports){
  Referee = function(){
    this._X_coordinates = [];
    this._O_coordinates = [];
    this._marker = 'O';
  };

  Referee.prototype = {
    check_game_status: function(x, y, marker){
      this._marker = marker;
      this.add_coordinates(x, y, marker);
      this.check_winning_conditions();
    },
    marker: function(){
      return this._marker;
    },
    x_coordinates: function() {
      return this._X_coordinates;
    },
    o_coordinates: function() {
      return this._O_coordinates;
    },
    add_coordinates: function(x, y, marker) {
      this['_' + this._marker + '_coordinates'].push([x,y]);
    },
    check_winning_conditions: function(){
      this.check_x_values();
    },
    check_x_values: function() {
        {for (var i=0; i < this['_' + this._marker + '_coordinates'].length; i++)
          a = (this['_' + this._marker + '_coordinates'][i][0]);
          array = [];
          array.push(a);}
          this.check_for_three(array);
    },
    check_for_three: function(array){
      var count = {};
        array.forEach(function(i){count[i] = (count[i]||0)+1;});
      if (count [0] > 2 || count[1] > 2 || count[2] > 2) {
        this._game_over();
      }
      else this.check_y_values();
    },
  };

  exports.referee = Referee;
})(this);
