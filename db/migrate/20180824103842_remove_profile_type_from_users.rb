class RemoveProfileTypeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :profile_type, :integer
  end
end
