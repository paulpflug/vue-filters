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
    onClick: () ->
      @click()
  filters:
    notPrevented: require "../src/notPrevented.coffee"
comp3 =
  template: "<div @click='onClick | notPrevented'><div @click='nothing'></div></div>"
  data: ->
    click = null
  methods:
    nothing: ->
    onClick: ->
      @click()
  filters:
    notPrevented: require "../src/notPrevented.coffee"
comp4 =
  template: "<div @click='onClick | notPrevented'><div @click.prevent='nothing'></div></div>"
  data: ->
    click = null
  methods:
    nothing: ->
    onClick: ->
      @click()
  filters:
    notPrevented: require "../src/notPrevented.coffee"
comp5 =
  template: "<div @click='onClick | notPrevented | prevent'></div>"
  data: ->
    click = null
  methods:
    onClick: () ->
      @click()
  filters:
    notPrevented: require "../src/notPrevented.coffee"
    prevent: require "../src/prevent.coffee"
comp1 = loadComp(comp1)
comp2 = loadComp(comp2)
comp3 = loadComp(comp3)
comp4 = loadComp(comp4)
comp5 = loadComp(comp5)
createEvent = ->
  return new MouseEvent 'click',
    'view': window
    'bubbles': true
    'cancelable': true
describe "notPrevented", ->
  it 'should call the event', ->
    comp1.click = chai.spy()
    comp1.$el.dispatchEvent(createEvent())
    comp1.click.should.have.been.called.once
  it 'should not work with .prevent', ->
    comp2.click = chai.spy()
    comp2.$el.dispatchEvent(createEvent())
    comp2.click.should.not.have.been.called()
  it 'should bubble', ->
    comp3.click = chai.spy()
    comp3.$el.firstChild.dispatchEvent(createEvent())
    comp3.click.should.have.been.called.once
  it 'should not be called when already prevented', ->
    comp4.click = chai.spy()
    comp4.$el.firstChild.dispatchEvent(createEvent())
    comp4.click.should.not.have.been.called()
  it 'should work with prevent filter', ->
    comp5.click = chai.spy()
    comp5.$el.dispatchEvent(createEvent())
    comp5.click.should.have.been.called.once
