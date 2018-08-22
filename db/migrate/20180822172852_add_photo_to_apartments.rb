class AddPhotoToApartments < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :photo, :string
  end
end
