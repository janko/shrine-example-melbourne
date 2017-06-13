class Photo < ApplicationRecord
  include ImageUploader::Attachment.new(:image) # image_data
end
