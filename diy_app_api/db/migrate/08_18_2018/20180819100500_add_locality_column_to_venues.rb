class AddLocalityColumnToVenues < ActiveRecord::Migration[5.2]
  def change
    add_reference :venues, :locality, foreign_key: true
  end
end
