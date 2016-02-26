

# connection = Fog::Storage.new({
#   :provider  => 'AWS',
#   :aws_access_key_id => ENV['AWS_SECRIT_KEY'],
#   :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
# })
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],
      :region                 => ENV['AWS_S3_REGION']
  }
  config.fog_directory  = ENV['S3_BUCKET']
end
