class Genre
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic # required to remove users using _delete field
  include Orderable
  include UpdatedAgo

  # attributes
  field :title
end