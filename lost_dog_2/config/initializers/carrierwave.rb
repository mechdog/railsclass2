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
      :aws_access_key_id      => '[ACCESS KEY]',
      :aws_secret_access_key  => '[SECRET KEY]'
    }
    config.fog_directory = 'lost_dog'
  end
end

