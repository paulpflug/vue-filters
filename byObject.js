(function() {
  var byObject;

  byObject = function(array, options) {
    var entry, found, i, key, len, result, value;
    result = [];
    if (!(Object.keys(options).length > 1)) {
      return array;
    }
    for (i = 0, len = array.length; i < len; i++) {
      entry = array[i];
      found = true;
      for (key in options) {
        value = options[key];
        if (entry[key] !== value) {
          found = false;
          break;
        }
      }
      if (found) {
        result.push(entry);
      }
    }
    return result;
  };

  module.exports = byObject;

}).call(this);
