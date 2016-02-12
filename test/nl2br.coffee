Vue = require "vue"
comp =
  template: "<div>{{{text | nl2br }}}</div>"
  filters:
    nl2br: require "../src/nl2br.coffee"
  data: ->
    text: "text\ntext"
compEl = document.createElement("comp")
document.body.appendChild(compEl)
app = new Vue
  el: "body"
  components:
    comp: comp
describe "escape", ->
  it 'should escape <,& and >', ->
    app.$children[0].$el.should.have.html "text<br>text"
