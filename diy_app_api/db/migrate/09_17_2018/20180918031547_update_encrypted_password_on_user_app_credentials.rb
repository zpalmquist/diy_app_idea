class UpdateEncryptedPasswordOnUserAppCredentials < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_app_credentials, :encrypted_password, :password_digest
  end
end
