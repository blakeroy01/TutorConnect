CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                       
    aws_access_key_id:     'AKIAUG3RGRBNUCPAH6FZ',                        
    aws_secret_access_key: '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',                        
	region:                'us-east-2',
  }
  config.fog_directory  = 'tutorconnectprofile'                                     
  
end