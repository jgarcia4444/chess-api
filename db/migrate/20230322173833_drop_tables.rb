class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :apple_tokens
    drop_table :google_tokens
  end
end
