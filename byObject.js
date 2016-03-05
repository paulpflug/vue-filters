(function() {
  var byObject;

  byObject = function(array, options) {
    var entry, found, i, key, len, result, value;
    result = [];
    console.log(options);
    if (Object.keys(options).length === 0) {
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
    console.log(result);
    return result;
  };

  module.exports = byObject;

}).call(this);
