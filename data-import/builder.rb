require 'mongo'
include Mongo
require 'bson'


@starting_rank = 1600

subjects = File.read("subjects.txt").split("\n")

mongo_client = MongoClient.new("localhost", 27017)
db = mongo_client.db("zoomash")
db.drop_collection("subjects")
col = db.collection("subjects")

subjects.each do |subject|
  doc = {
    location: subject,
    rank: @starting_rank,
    random: Random.rand()
  }
  col.insert(doc)
end

# col.ensureIndex({random: 1})