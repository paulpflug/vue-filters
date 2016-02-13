Vue = require "vue"
comp1 =
  template: "<div @click='onClick | notPrevented'></div>"
  data: ->
    click = null
  methods:
    onClick: ->
      @click()
  filters:
    notPrevented: require "../src/notPrevented.coffee"
comp2 =
  template: "<div @click.prevent='onClick | notPrevented'></div>"
  data: ->
    click = null
  methods:
    onClick: ->
      @click()
  filters:
    notPrevented: require "../src/notPrevented.coffee"
comp3 =
  template: "<div @click='onClick | notPrevented'><div @click.prevent='nothing'></div></div>"
  data: ->
    click = null
  methods:
    nothing: ->
    onClick: ->
      @click()
  filters:
    notPrevented: require "../src/notPrevented.coffee"
app = new Vue
  replace: false
  template: "<comp1></comp1><comp2></comp2><comp3></comp3>"
  el: "body"
  components:
    comp1: comp1
    comp2: comp2
    comp3: comp3
comp1 = app.$children[0]
comp2 = app.$children[1]
comp3 = app.$children[2]
describe "notPrevented", ->
  it 'should call the event', ->
    comp1.click = chai.spy()
    comp1.$el.dispatchEvent(new Event("click"))
    comp1.click.should.have.been.called.once
  it 'should work with .prevent', ->
    comp2.click = chai.spy()
    comp2.$el.dispatchEvent(new Event("click"))
    comp2.click.should.have.been.called.once
  it 'should not be called when already prevented', ->
    comp3.click = chai.spy()
    comp3.$el.firstChild.dispatchEvent(new Event("click"))
    comp3.click.should.not.have.been.called
