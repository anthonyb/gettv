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

  # helpers
  def chr_title
    "#{male_title} / #{female_title}"
  end
end