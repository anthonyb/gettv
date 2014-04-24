CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage           = :file
    config.cache_dir         = "#{Rails.root}/public/uploads/tmp/test"
    config.enable_processing = false

  elsif Rails.env.development?
    config.storage   = :file
    config.cache_dir = "#{Rails.root}/public/uploads/tmp"

  elsif Rails.env.production?
    config.storage         = :fog
    config.cache_dir       = "#{Rails.root}/public/uploads/tmp"
    config.fog_directory   = ENV['FOG_DIRECTORY']
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      #:endpoint              => 'https://s3.amazonaws.com/'
    }
  end
end