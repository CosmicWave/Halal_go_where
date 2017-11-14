
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIF7PH3XHNPZDHNOA',        # required
    aws_secret_access_key: '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'        # required
  }
  config.fog_directory  = 'halalgowhere3'             # required
end