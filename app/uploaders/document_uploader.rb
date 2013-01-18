# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :fog
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cover
    manipulate! do |frame, index|
      frame if index.zero?
    end
  end

  version :thumb do
    process :cover

    process :resize_to_limit => [200, 200]
    process :convert => 'jpg'
  end

  def extension_white_list
    %w(pdf)
  end

end
