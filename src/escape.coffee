# out: ../escape.js
entityRE = /[&<>]/g
entityMap =
  '&': '&amp;'
  '<': '&lt;'
  '>': '&gt;'
escapeEntity = (entity) -> entityMap[entity]
escape = (text) ->
  String(text).replace(entityRE, escapeEntity)
module.exports = escape
