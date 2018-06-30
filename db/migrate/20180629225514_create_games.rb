class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :word, foreign_key: true
      t.integer :guesses

      t.timestamps
    end
  end
end
