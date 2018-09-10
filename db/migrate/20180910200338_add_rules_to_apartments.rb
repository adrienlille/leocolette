class AddRulesToApartments < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :rules, :text
  end
end
