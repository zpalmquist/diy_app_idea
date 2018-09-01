class RemoveRatingFromVenues < ActiveRecord::Migration[5.2]
  def change
    remove_column :venues, :rating, :integer
  end
end
