require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :default_storage, cache: :test_cache, store: :test_store
  plugin :validation_helpers
  plugin :remove_invalid
  plugin :derivatives

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    { 
      small:  magick.resize_to_limit!(100, 100)
    }
  end

  Attacher.validate do
    # DEBUG: always fail
    errors << "fail"
    # filepath = file.download.path
    # if true
    #   errors << "スキャンをパスできませんでした。スキャン自体に失敗したか、画像ファイルが安全でないと判定されました。"
    # end
  end
end