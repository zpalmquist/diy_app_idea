class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.integer :rating
      t.string  :genre, default: "No Genre Specified"
      
      t.integer :locality_id, foreign_key: true
    end
  end
end
