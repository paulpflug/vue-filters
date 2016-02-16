(function() {
  var prevent;

  prevent = function(fn) {
    return function(e) {
      fn(e);
      return e.preventDefault();
    };
  };

  module.exports = prevent;

}).call(this);
