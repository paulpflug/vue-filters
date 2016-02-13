(function() {
  var notPrevented;

  notPrevented = function(fn) {
    return function(e) {
      if (e.defaultPrevented) {
        return;
      }
      return fn(e);
    };
  };

  module.exports = notPrevented;

}).call(this);
