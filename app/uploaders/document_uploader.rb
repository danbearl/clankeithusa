# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :fog
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [200,200]
    process :convert => 'jpg'
    process :paper_shape
    process :convert => 'jpg'
    def full_filename (for_file = model.logo.file)
      super.chomp(File.extname(super)) + '.jpg'
    end
  end

  def paper_shape
    manipulate! do |img|
      if img.rows*4 != img.columns*3
        width=img.columns
        height=img.columns/3*4
        img.crop!(0,0,width,height,true)
      else
        img
      end
    end
        
  end

  def extension_white_list
    %w(pdf)
  end

end
