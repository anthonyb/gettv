class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Orderable
  include UpdatedAgo

  # attributes
  field :title

  # relations
  has_many :answers
end