require "shrine"
require "shrine/storage/file_system"

Shrine.storages = { 
  test_cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary 
  test_store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent 
}

class Shrine::Attacher
  def promote(*)
    create_derivatives
    super
  end
end

Shrine.plugin :activerecord