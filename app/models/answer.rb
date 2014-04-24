class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Orderable

  # attributes
  field :title

  # relations
  belongs_to :question
  has_and_belongs_to_many :result

  # uploader
  mount_uploader :image, AnswerImageUploader
end