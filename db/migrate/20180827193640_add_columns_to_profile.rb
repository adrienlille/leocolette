class AddColumnsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :city, :string
    add_column :profiles, :postal_code, :integer
    add_column :profiles, :about_me, :string
    add_column :profiles, :phone_number, :string
  end
end
