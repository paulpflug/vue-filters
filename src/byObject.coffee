# out: ../byObject.js
byObject = (array, options) ->
  result = []
  console.log options
  return array if Object.keys(options).length == 0
  for entry in array
    found = true
    for key,value of options
      if entry[key] != value
        found = false
        break
    result.push entry if found
  console.log result
  return result
module.exports = byObject
