class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :description
      t.string :street
      t.string :city
      t.string :postal_code
      t.integer :bedrooms
      t.integer :bathrooms
      t.references :user, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
