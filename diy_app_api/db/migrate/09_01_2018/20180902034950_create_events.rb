class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      
      t.integer  :venue_id, foreign_key: true

      t.timestamps
    end
  end
end
