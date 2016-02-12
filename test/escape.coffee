Vue = require "vue"
comp =
  template: "<div>{{{text | escape }}}</div>"
  filters:
    escape: require "../src/escape.coffee"
  data: ->
    text: "text&<br>text"
compEl = document.createElement("comp")
document.body.appendChild(compEl)
app = new Vue
  el: "body"
  components:
    comp: comp
describe "escape", ->
  it 'should escape <,& and >', ->
    app.$children[0].$el.should.have.html "text&amp;&lt;br&gt;text"
