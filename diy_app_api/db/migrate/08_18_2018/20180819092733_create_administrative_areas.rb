class CreateAdministrativeAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :administrative_areas do |t|
      t.string :name
      t.references :country, foreign_key: true
    end
  end
end
