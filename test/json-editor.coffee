grunt = require 'grunt'
path = require 'path'
fs = require 'fs'

describe 'json-editor task', ->
  afterEach (done) ->
    config = require './fixtures/config'
    config.foo.bar[0].baz = 'quux'
    fs.writeFile path.resolve(__dirname + '/fixtures/config'), JSON.stringify(config, null, 2), done
  Given -> @subject = require '../tasks/json-editor'
  Given -> @subject grunt
  When (done) -> grunt.task.run 'json', done
  And -> @config = require './fixtures/config'
  Then -> expect(@config.foo.bar[0].baz).to.equal 'NOT quux'
