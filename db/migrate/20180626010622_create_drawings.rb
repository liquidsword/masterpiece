class CreateDrawings < ActiveRecord::Migration[5.1]
  def change
    create_table :drawings do |t|
      t.string :art
      t.integer :artist_id

      t.timestamps
    end
  end
end
