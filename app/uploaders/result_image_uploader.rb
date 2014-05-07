class ResultImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Meta

  def store_dir
    "uploads/result_images/#{ model.id }"
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
    process resize_and_pad: [590, 454]
    process :store_meta
  end
end