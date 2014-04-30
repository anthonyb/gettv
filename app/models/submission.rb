class Submission
  include Mongoid::Document
  include Mongoid::Timestamps
  include CreatedAgo

  # attibutes
  field :email
  field :full_name
  field :zip_code
  field :favorite_genre
  field :character
  field :answers

  # validations
  validates_presence_of :email, :full_name

  # scopes
  default_scope -> { desc(:created_at) }
end