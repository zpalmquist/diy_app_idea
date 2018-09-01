class CreateBandRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :band_ratings do |t|
      t.references :rating, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
