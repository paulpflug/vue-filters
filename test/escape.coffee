comp =
  template: "<div>{{{text | escape }}}</div>"
  filters:
    escape: require "../src/escape.coffee"
  data: ->
    text: "text&<br>text"
comp = loadComp(comp)
describe "escape", ->
  it 'should escape <,& and >', ->
    comp.$el.should.have.html "text&amp;&lt;br&gt;text"
