#
# # Redirect
#
# A plugin to create pages based off of a template and source json
# file.
#
fs   = require 'fs'
yaml = require 'js-yaml'
newPage = require './new-page'




module.exports = (opts={}) ->
  opts.redirects ?= '../redirects.yaml'
  opts.template  ?= 'redirect.toffee'

  redirects = yaml.safeLoad fs.readFileSync opts.redirects, 'utf8'

  (files, metalsmith, done) ->
    redirectKeys = Object.keys redirects
    do next = ->
      rSource = redirectKeys.pop()
      if not rSource? then return done()
      rDestination = redirects[rSource]

      output = if rSource[0] is '/' then rSource[1..] else rSource
      pageOpts =
        output: output
        metadata:
          template: opts.template
          source: rSource
          destination: rDestination
      newPage(pageOpts) files, metalsmith, next

