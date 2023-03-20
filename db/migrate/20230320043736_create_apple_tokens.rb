class CreateAppleTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :apple_tokens do |t|
      t.string :access_token
      t.string :refresh_token
      t.datetime :expires_at
      t.integer :user_id

      t.timestamps
    end
  end
end
