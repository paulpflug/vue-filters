# out: ../byObject.js
byObject = (array, options) ->
  result = []
  return array unless Object.keys(options).length > 1
  for entry in array
    found = true
    for key,value of options
      if entry[key] != value
        found = false
        break
    result.push entry if found
  return result
module.exports = byObject
