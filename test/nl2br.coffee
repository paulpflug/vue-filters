Vue = require "vue"
comp =
  template: "<div>{{{text | nl2br }}}</div>"
  filters:
    nl2br: require "../src/nl2br.coffee"
  data: ->
    text: "text\ntext"
app = new Vue
  replace: false
  template: "<comp></comp>"
  el: "body"
  components:
    comp: comp
describe "nl2br", ->
  it 'should convert \\n to <br>', ->
    app.$children[0].$el.should.have.html "text<br>text"
