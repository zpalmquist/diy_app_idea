class DropAppCredentialsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_app_credentials do |t|
      t.string :encrypted_password
      t.integer :user_id

      t.references :user_id
    end
  end
end
