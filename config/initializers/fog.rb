CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => 'AKIAICOMXF6MSZG5XVUA',
    :aws_secret_access_key => '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'
  }
  config.fog_directory = 'clankeithusa'
  config.fog_public = true
end
