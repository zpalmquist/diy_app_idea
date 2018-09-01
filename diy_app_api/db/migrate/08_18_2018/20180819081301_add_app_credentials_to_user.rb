class AddAppCredentialsToUser < ActiveRecord::Migration[5.1]
  def change
    create_table :user_app_credentials do |t|
      t.string :encrypted_password, null: false, default: ""
      t.integer :user_id, index: true, foreign_key: true
    end
  end
end
