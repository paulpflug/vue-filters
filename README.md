# vue-filters

A collection of filters for vue.
Designed for [**webpack**](https://webpack.github.io/) workflows.

## Policy

all sorts of filters can be submitted. There will be no removes because of deprecation. If the API of a filter changes the name has to change.

## Install

```sh
npm install --save-dev vue-filters

```
## Usage
```coffee
## whithin your module
components:
  filters:
    escape: require("vue-filters/escape")
```
## List of mixins
| Name | description |
| ---: |  ------- |
| escape | turns `&`,`<` and `>` to `&amp;`, `&lt;` and `&gt;` (usage [raw html](http://vuejs.org/guide/syntax.html#Raw_HTML))|
| nl2br | turns `\n` to `<br>` (usage [raw html](http://vuejs.org/guide/syntax.html#Raw_HTML))|



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
