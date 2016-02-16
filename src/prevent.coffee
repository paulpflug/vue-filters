# out: ../prevent.js
prevent = (fn) ->
  return (e) ->
    fn(e)
    e.preventDefault()
module.exports = prevent
