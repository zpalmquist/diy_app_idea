class CreateUserBands < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bands do |t|
      t.references :user, foreign_key: true
      t.references :band, foreign_key: true
    end
  end
end
