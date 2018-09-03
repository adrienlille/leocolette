class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.boolean :read
      t.text :text
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
