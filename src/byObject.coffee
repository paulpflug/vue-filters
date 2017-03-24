# out: ../byObject.js
byObject = (array, options) ->
  result = []
  if not options? or Object.keys(options).length == 0
    return array
  for entry in array
    found = true
    for key,value of options
      if entry[key] != value
        found = false
        break
    result.push entry if found
  return result
module.exports = byObject
