class DropTempmessages < ActiveRecord::Migration[5.1]
  def change
    drop_table :tempmessages
  end
end
