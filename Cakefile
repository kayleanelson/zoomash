{print} = require 'util'
{spawn} = require 'child_process'

task 'build', 'Build from src/', ->
  coffee = spawn 'node_modules/.bin/coffee', ['-c', '-m', '-o', '.', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'server', 'Watch src/ for changes', ->
  coffee = spawn 'node_modules/.bin/coffee', ['-w', '-c', '-m', '-o', '.', 'src']
  nodemon = spawn 'node_modules/.bin/nodemon', ['app.js']
  
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  nodemon.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  nodemon.stdout.on 'data', (data) ->
    print data.toString()