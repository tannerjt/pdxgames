class AddCategoryToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :category, foreign_key: true
  end
end
