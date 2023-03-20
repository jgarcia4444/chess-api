class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :winning_user_id
      t.integer :losing_user_id
      t.integer :game_duration

      t.timestamps
    end
  end
end
