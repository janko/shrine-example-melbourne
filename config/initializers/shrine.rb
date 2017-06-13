require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new(Rails.root.join("public"), prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new(Rails.root.join("public"), prefix: "uploads/store"),
}

Shrine.plugin :activerecord
Shrine.plugin :logging
