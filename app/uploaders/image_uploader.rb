require "image_processing/mini_magick"

class ImageUploader < Shrine
  # OK
  # plugin :derivatives
  # plugin :remove_invalid
  # plugin :validation

  # NG
  plugin :remove_invalid
  plugin :derivatives
  plugin :validation

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    { 
      small:  magick.resize_to_limit!(100, 100)
    }
  end

  Attacher.validate do
    # DEBUG: always fail
    # errors << "fail"
  end
end