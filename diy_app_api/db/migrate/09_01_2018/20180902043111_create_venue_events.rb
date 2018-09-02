class CreateVenueEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :venue_events do |t|
      t.references :venue, foreign_key: true
      t.references :event, foreign_key: true
      
      t.timestamps
    end
  end
end
