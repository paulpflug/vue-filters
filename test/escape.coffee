Vue = require "vue"
comp =
  template: "<div>{{{text | escape }}}</div>"
  filters:
    escape: require "../src/escape.coffee"
  data: ->
    text: "text&<br>text"
app = new Vue
  replace: false
  template: "<comp></comp>"
  el: "body"
  components:
    comp: comp
describe "escape", ->
  it 'should escape <,& and >', ->
    app.$children[0].$el.should.have.html "text&amp;&lt;br&gt;text"
