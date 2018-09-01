class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.float :score, default: 0.0
      t.text :comment, default: ""

      t.timestamps
    end
  end
end
