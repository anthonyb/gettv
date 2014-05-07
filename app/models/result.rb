class Result
  include Mongoid::Document
  include Mongoid::Timestamps
  include Orderable
  include UpdatedAgo

  # attributes
  field :male_title
  field :female_title
  field :male_description
  field :female_description

  # relations
  has_and_belongs_to_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: false

  # uploader
  mount_uploader :male_image, ResultImageUploader
  mount_uploader :female_image, ResultImageUploader

  # helpers
  def chr_title
    "#{male_title} / #{female_title}"
  end
end