class AddImageDataToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :image_data, :text
  end
end
