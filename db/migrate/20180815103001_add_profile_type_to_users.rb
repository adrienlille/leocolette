class AddProfileTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_type, :integer
  end
end
