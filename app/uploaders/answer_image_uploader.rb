class AnswerImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Meta

  def store_dir
    "uploads/anwser_images/#{ model.id }"
  end

  def default_url
    ActionController::Base.helpers.asset_path(
      "fallback/" + [version_name, "default.png"].compact.join('_'))
  end

  version :small do
    process resize_and_pad: [56, 56]
    process :store_meta
  end

  version :grid do
    process resize_and_pad: [227 * 2, 138 * 2]
    process :store_meta
  end
end