# DEPRECATED

# vue-filters

A collection of filters for vue.

## Policy

all sorts of filters can be submitted. There will be no removes because of deprecation. If the API of a filter changes, the name has to change.

## Install
```sh
npm install --save-dev vue-filters
```
or include `bundle.js`
## Usage
```coffee
## whithin your module
components:
  filters:
    escape: require("vue-filters/escape")
# if you have used the bundle.js
components:
  filters:
    escape: window.vueFilters.escape
```
## List of filters
| Name | arguments| description |
| ---: | ------ |  ------- |
| escape | string | turns `&`,`<` and `>` to `&amp;`, `&lt;` and `&gt;` (usage [raw html](http://vuejs.org/guide/syntax.html#Raw_HTML))|
| nl2br | string | turns `\n` to `<br>` (usage [raw html](http://vuejs.org/guide/syntax.html#Raw_HTML))|
| byObject | array, object | only entries in the array matching all keys and values of the provided object will be included|
| notPrevented | function | only call function when `event.defaultPrevented` is false |
| prevent | function | call function and call `event.preventDefault()` afterwards |

## Detailed usage
### byObject
```html
<div v-for="entry in array | byObject {name:'john',age:'24'}">
// dynamic
<div v-for="entry in array | byObject {name:{{filtername}},age:{{filterage}}}">
// or just pass an object from your Vue instance
<div v-for="entry in array | byObject someFilterObject">
```

### notPrevented
read: https://css-tricks.com/dangers-stopping-event-propagation/
```html
// when clicked on the child, parentClick won't be called
<div @click="parentClick | notPrevented"><div @click.prevent="childClick"></div></div>

```

### prevent
read: https://css-tricks.com/dangers-stopping-event-propagation/
```html
// won't work
<div @click.prevent="onClick | notPrevented"></div>
// will work
<div @click="onClick | notPrevented | prevent"></div>
```

## Develop
Clone rep
```
npm install
```
Available scripts:
```
npm run build # compiles coffee-script in src/
npm run test # runs a single-run karma in chrome and firefox
npm run watch # runs karma in chrome (uses src/*.coffee files direclty, no need for build)

# to run only single tests:
karma start --browsers Chrome --auto-watch --reporters spec --files ['test/onClick.coffee']
```

## License
Copyright (c) 2015 Paul Pflugradt
Licensed under the MIT license.
