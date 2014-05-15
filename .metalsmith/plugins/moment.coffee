#
# # Add Moment.js to Metadata
#
moment = require 'moment'




module.exports = -> (files, metalsmith, done) ->
  data = metalsmith.metadata()
  data.moment = moment
  metalsmith.metadata data
  done()
