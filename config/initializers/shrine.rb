require "shrine"
require "shrine/storage/file_system"

Shrine.storages = { 
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary 
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent 
}

class Shrine::Attacher
  def promote(*)
    create_derivatives
    super
  end
end

Shrine.plugin :activerecord