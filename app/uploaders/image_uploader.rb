require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :processing
  plugin :versions
  plugin :determine_mime_type
  plugin :store_dimensions
  plugin :validation_helpers
  plugin :cached_attachment_data

  Attacher.validate do
    validate_mime_type_inclusion %w[image/jpeg image/png], message: "must be an image"
    validate_max_size 5*1024*1024, message: "must be smaller than 5MB"
  end

  process(:store) do |io|
    original = io.download

    size_800 = resize_to_limit(original, 800, 800)
    size_500 = resize_to_limit(original, 500, 500)
    size_100 = resize_to_limit(original, 100, 100)

    { original: io, large: size_800, medium: size_500, small: size_100 }
  end
end
