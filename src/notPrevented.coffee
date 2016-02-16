# out: ../notPrevented.js
notPrevented = (fn) ->
  return (e) ->
    return if e.defaultPrevented
    fn(e)
module.exports = notPrevented
