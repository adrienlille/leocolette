class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :account_type
      t.string :photo

      t.timestamps
    end
  end
end
