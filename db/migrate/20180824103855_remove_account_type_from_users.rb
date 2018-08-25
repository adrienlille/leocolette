class RemoveAccountTypeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :account_type, :string
  end
end
