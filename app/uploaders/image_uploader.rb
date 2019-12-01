require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :derivatives
  plugin :validation
  plugin :validation_helpers
  plugin :remove_invalid

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    { 
      small:  magick.resize_to_limit!(100, 100)
    }
  end

  Attacher.validate do
    # DEBUG: always fail
    #errors << "fail"
  end
end