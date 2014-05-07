AssetSync.configure do |config|
  config.fog_provider          = 'AWS'
  config.aws_access_key_id     = ENV['AWS_ACCESS_KEY_ID']
  config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  config.fog_directory         = ENV['FOG_DIRECTORY']
  #config.fog_region            = 'eu-west-1'

  # Don't delete files from the store
  config.existing_remote_files = "delete"

  # Automatically replace files with their equivalent gzip compressed version
  config.gzip_compression = true
end
