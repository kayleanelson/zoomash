express = require "express"
mongoose = require "mongoose"

app = express()
mongoose.connect('mongodb://localhost/zoomash')
db = mongoose.connection


SubjectScheme = new mongoose.Schema({ id: 'string', location: 'string', rank: 'number', random: 'number'})
Subject = mongoose.model('Subject', SubjectScheme)

# Subject.find({random: {"$gt": Math.random}}).sort("random").limit(1)[0]

app.get('/subjects', (req, res) ->

  Subject.find({random: {"$gt": Math.random()}}).sort("random").limit(1).execFind( (err, subject) ->
    res.json(subject)
  )

)

app.use(express.bodyParser())
app.use( express.static(__dirname) )
app.listen(process.env.PORT || 8000)