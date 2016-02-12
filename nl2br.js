(function() {
  var nl2br;

  nl2br = function(text) {
    return String(text).replace(/\n/g, "<br>");
  };

  module.exports = nl2br;

}).call(this);
