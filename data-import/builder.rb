require 'mongo'
include Mongo

@starting_rank = 1600

subjects = File.read("../urls/serengeti_urls.csv").split("\n")
puts subjects

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