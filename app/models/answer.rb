class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Orderable

  # attributes
  field :title

  # relations
  belongs_to :question
end