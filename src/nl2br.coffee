# out: ../nl2br.js
nl2br = (text) ->
  String(text).replace(/\n/g,"<br>")
module.exports = nl2br
