comp =
  template: "<ul><li v-for='d in data | byObject filter'>{{d.name}}{{d.name2}}{{d.name3}}</li></ul>"
  filters:
    byObject: require "../src/byObject.coffee"
  data: ->
    data: [
      {name: "test1", name2: "test", name3:"test"}
      {name: "test2", name2: "test", name3:"test"}
      {name: "test3", name2: "test3", name3:"test"}
    ]
    filter: {name: "test1", name2: "test"}
comp = loadComp(comp)
describe "byObject", ->
  it 'should filter by given object', ->
    comp.$el.should.have.html "<li>test1testtest</li>"
