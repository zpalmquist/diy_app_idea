class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise  :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook] # eventually add soundcloud

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email,    presence: true, uniqueness: { case_sensitive: false }

  has_one_attached :profile_pic

  has_many :user_bands
  has_many :bands, through: :user_bands, dependent: :destroy

  has_many :user_venues

  has_many :venues, through: :user_venues, dependent: :destroy

  enum role: %w(default admin)

  def sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  # The user is first searched using the provider string and user id(uid)
  # by the first_or_create method.
  def self.create_user_from_omniauth(auth)
    where(auth.slice(:provider, :uid, :email)).first_or_create do |user|
      user.user_omniauth_credentials.email    = auth.email
      user.user_omniauth_credentials.provider = auth.provider
      user.user_omniauth_credentials.uid      = auth.uid
    end
  end

  def self.sign_in_from_app_credentials(auth)
   find_by(
     username: auth['username'],
     encrypted_password: auth['encrypted_password']
   )
  end

  def self.create_user_from_app_credentials(auth)
   create(
    user.email = auth['email'],
    user.username = auth['username'],
    user.user_app_credentials.encrypted_password = auth['password']
   )
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
