class AddNameToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :name, :string
  end
end
