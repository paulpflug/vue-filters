(function() {
  var entityMap, entityRE, escape, escapeEntity;

  entityRE = /[&<>]/g;

  entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;'
  };

  escapeEntity = function(entity) {
    return entityMap[entity];
  };

  escape = function(text) {
    return String(text).replace(entityRE, escapeEntity);
  };

  module.exports = escape;

}).call(this);
