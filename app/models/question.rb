class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Orderable
  include UpdatedAgo

  # attributes
  field :title

  # relations
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end