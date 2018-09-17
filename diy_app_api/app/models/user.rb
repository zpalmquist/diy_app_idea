class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # include ActiveModel::Validations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

 validates :username, presence: true, uniqueness: { case_sensitive: false }
 validates_uniqueness_of :email

  has_one_attached :profile_pic

  has_one :user_app_credential, dependent: :destroy
  has_one :user_oauth_credential, dependent: :destroy

  has_many :user_bands
  has_many :bands, through: :user_bands

  has_many :user_venues
  has_many :venues, through: :user_venues

  enum role: %w(default admin)

  def self.sign_in_from_omniauth(auth)
    find_by(
      provider: auth['provider'],
      uid:      auth['uid']
    ) || create_user_from_omniauth
  end

  def self.create_user_from_omniauth(auth)
    # The user is first searched using the provider string and user id(uid)
    # by the first_or_create method.
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.user_omniauth_credentials.provider = auth.provider
      user.user_omniauth_credentials.uid = auth.uid
      # user.username = auth.info.nickname if auth.info.include?(:nickname)
      ## Maybe on user.username setting.
      ## Why? Because I'd really rather the user have to set up their own
      ## username for the site
      user.profile_pic = auth.image if auth.include?(:image)
    end
  end

  def self.sign_in_from_app_credentials(auth)
  #  find_by(
  #    params
  #  )
  end

  def self.create_user_from_app_credentials(auth)
   create(
    user.email = auth['email'],
    user.username = auth['username'],
    user.user_app_credentials.encrypted_password = auth['password']
    # params
   )
  end

  def self.new_with_session(params, session)
    # if session["devise.user_attributes"]
    #   new(session["devise.user_attributes"], without_protection: true) do |user|
    #     user.attributes = params
    #     user.valid?
    #   end
    #  else
    #    super
    # end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    # if encrypted_password.blank?
    #   update_attributes(params, *options)
    # else
    #   super
    # end
  end

end
