class Movies
  include Mongoid::Document
  include Mongoid::Timestamps
  field :lcid,  as: :lcid, type: Integer
  field :data, as: :data, type: String
  index({lcid: 1 }, {name: "movie_id", unique: true})
end