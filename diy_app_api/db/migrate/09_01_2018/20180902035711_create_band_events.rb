class CreateBandEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :band_events do |t|
      t.references :band, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
