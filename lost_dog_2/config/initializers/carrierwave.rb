#config/initializers/carrierwave.rb 

if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    configure.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJXSIPKWQVNP33V5Q',
      :aws_secret_access_key  => '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'
    }
    config.fog_directory = 'lost_dog'
  end
end

