comp =
  template: "<div>{{{text | nl2br }}}</div>"
  filters:
    nl2br: require "../src/nl2br.coffee"
  data: ->
    text: "text\ntext"
comp = loadComp(comp)
describe "nl2br", ->
  it 'should convert \\n to <br>', ->
    comp.$el.should.have.html "text<br>text"
