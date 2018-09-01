class RemoveRatingFromBands < ActiveRecord::Migration[5.2]
  def change
    remove_column :bands, :rating, :integer
  end
end
