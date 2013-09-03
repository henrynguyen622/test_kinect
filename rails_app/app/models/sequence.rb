class Sequence
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tid,  as: :task_id, type: String
  field :pid,  as: :patient_id, type: Integer
  field :sta,  as: :state, type: Integer #01:on 00:off
  field :tin,  as: :task_index, type: Integer
  field :rei,  as: :repetition_index, type: Integer
  field :rat, as: :recorded_at, type: Time
  field :num,  as: :num_rounds, type: Integer
  field :rgb, as: :rgb_movies, type: String
  field :dep, as: :depth_movies, type: String
  field :ske, as: :skeleton, type: Hash
  field :tra, as: :trajectory, type: Hash
  field :den, as: :density, type: Hash
  field :step, as: :step, type: Hash
  index({tid: 1 }, {name: "idx_task_id", unique: true})
  index({pid: 1 }, {name: "idx_patient_id"})
end