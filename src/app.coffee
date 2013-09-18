express = require "express"
mongoose = require "mongoose"

app = express()

app.use( express.bodyParser() )

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

app.post("/classification", (req, res) ->
  classification = req.body
  
  Subject.find({_id: classification.id}).execFind( (err, subject) ->
    subject.rank = classification.rank
    Subject.update({_id: classification.id}, {rank: classification.rank})
  )
  
  res.json(true)
)

# app.post('/classification', function(req, res) {
#   if(!req.body.hasOwnProperty('author') || 
#      !req.body.hasOwnProperty('text')) {
#     res.statusCode = 400;
#     return res.send('Error 400: Post syntax incorrect.');
#   }
# 
#   var newQuote = {
#     author : req.body.author,
#     text : req.body.text
#   };
# 
#   quotes.push(newQuote);
#   res.json(true);
# });

app.use( express.static(__dirname) )
app.listen(process.env.PORT || 8000)