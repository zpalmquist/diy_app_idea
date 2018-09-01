class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|
      t.string :name
      t.references :administrative_area, foreign_key: true
    end
  end
end
