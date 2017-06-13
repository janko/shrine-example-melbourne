class Photo < ApplicationRecord
  include ImageUploader::Attachment.new(:image) # image_data

  validates_presence_of :title, :description, :image
end
