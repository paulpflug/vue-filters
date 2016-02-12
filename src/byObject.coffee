# out: ../byObject.js
byObject = (array, options) ->
  result = []
  toFind = Object.keys(options).length
  return array unless toFind
  for entry in array
    found = 0
    for key,value of options
      if entry[key] == value
        found += 1
    if found == toFind
      result.push entry
  return result
module.exports = byObject
