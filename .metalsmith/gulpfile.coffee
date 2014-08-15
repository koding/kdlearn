#
# # Gulpfile
#
# The Gulpfile is responsible for compiling our Metalsmith project,
# sass, and any other build processes we may need. It also supports live
# compiling the project, and reloading the code.
#
# Run with `cult`, and see README.md for more usage docs.
#
metal   = require './metal'
path    = require 'path'
connect = require 'connect'
gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
concat  = require 'gulp-concat'
sass    = require 'gulp-sass'
uglify  = require 'gulp-uglify'
util    = require 'gulp-util'



paths =
  code: [
    '!sass/**'
    # I had a hard time ignoring node_modules, so instead
    # i'm manually adding the dirs i want to watch.
    '*'
    'plugins/**'
    'static/**'
    'templates/**'
  ]
  coffee: 'client/**/*.coffee'
  documents: [
    '!**'
    '../**/*.md'
  ]
  sass: './sass/**/*.scss'
  staticDocuments: [
    '!**'
    '!../**/*.md'
    '../**/*.*'
    ]
  static: [
    '!static/**/*.coffee'
    'static/**/*'
    ]
  vendor: js: [
    'vendor/js/**/*.js'
    ]

# ## client:coffee
#
# Compile coffee found in the static dir.
gulp.task 'client:coffee', ->
  gulp.src paths.coffee
    .pipe coffee()
    .pipe uglify()
    .pipe concat 'main.js'
    .pipe gulp.dest 'build/js'



# ## metalsmith
#
# Compile our metalsmith markdown and templates.
gulp.task 'metalsmith', -> metal()


# ## preview
#
# Run a small http server pointed at the build directory, to preview
# the compiled pages.
gulp.task 'preview', ['build'], ->
  connect()
    .use connect.static path.join __dirname, 'build'
    .listen 8000


# ## sass
#
# Compile our sass to css in the build dir.
gulp.task 'sass', ->
  gulp.src paths.sass
    .pipe sass()
    .pipe gulp.dest 'build/css'


# ## static
#
# Copy static assets to build dir.
gulp.task 'static', ->
  gulp.src paths.static
    .pipe gulp.dest 'build'


# ## staticDocuments
#
# Copy static assets to build dir.
gulp.task 'staticDocuments', ->
  gulp.src paths.staticDocuments
    .pipe gulp.dest 'build'


# ## vendor:js
#
# Uglify all of the vendor files and concatenate them into a
# single file.
gulp.task 'vendor:js', ->
  gulp.src paths.vendor.js
    .pipe uglify()
    .pipe concat 'vendor.js'
    .pipe gulp.dest 'build/js'


# ## watch:code
#
# Watch the metalsmith code and reload it when changes are detected.
# Note that this will not reload changes to this Gulpfile.
gulp.task 'watch:code', ->
  gulp.watch paths.code, ['coffee', 'static'], ->
    util.log 'Code changed, reloading and compiling.'
    delete require.cache[path.join __dirname, 'metal.coffee']
    metal = require './metal'
    metal()


# ## watch:md
#
# Run a web server exposing the files in the build directory, and recompile
# the markdown on change.
gulp.task 'watch:md', ['metalsmith'], ->
  gulp.watch paths.documents, ['metalsmith']


# ## watch:sass
#
# Watch sass files for changes, compile on change.
gulp.task 'watch:sass', ['sass'], ->
  gulp.watch paths.sass, ['sass']


gulp.task 'client', ['client:coffee']
gulp.task 'vendor', ['vendor:js']

gulp.task 'watch', ['watch:md']
gulp.task 'watch:all', ['watch:md', 'watch:code', 'watch:sass']
gulp.task 'build', [
  'metalsmith',
  'sass',
  'client', 'vendor'
  'static', 'staticDocuments']
gulp.task 'default', ['build']
