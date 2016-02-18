vueFilter = {
  byObject: require('./byObject.js'),
  escape: require('./escape.js'),
  nl2br: require('./nl2br.js'),
  notPrevented: require('./notPrevented.js'),
  prevent: require('./prevent.js')
}
if (module.exports != null){
  module.exports = vueFilter
} else {
  window.vueFilters = vueFilter
}
