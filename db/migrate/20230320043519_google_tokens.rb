class GoogleTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :google_tokens do |t|
      t.string :access_token
      t.string :refresh_token
      t.integer :user_id
      t.datetime :expires_at

      t.timestamps
    end
  end
end
