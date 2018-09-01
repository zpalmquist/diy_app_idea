class CreateUserOmniauthCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :user_omniauth_credentials do |t|
      t.string :provider, null: false
      t.string :uid, null: false

      t.integer :user_id, index: true, foreign_key: true
    end
  end
end
