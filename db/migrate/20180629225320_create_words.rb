class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word
      t.integer :length
      t.boolean :unique_letters

      t.timestamps
    end
  end
end
