(function() {
  var byObject;

  byObject = function(array, options) {
    var entry, found, i, key, len, result, toFind, value;
    result = [];
    toFind = Object.keys(options).length;
    if (!toFind) {
      return array;
    }
    for (i = 0, len = array.length; i < len; i++) {
      entry = array[i];
      found = 0;
      for (key in options) {
        value = options[key];
        if (entry[key] === value) {
          found += 1;
        }
      }
      if (found === toFind) {
        result.push(entry);
      }
    }
    return result;
  };

  module.exports = byObject;

}).call(this);
