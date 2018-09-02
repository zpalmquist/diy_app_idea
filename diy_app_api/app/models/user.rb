class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  has_one_attached :profile_pic

  has_many :user_bands
  has_many :bands, through: :user_bands

  has_and_belongs_to_many :bands

  has_many :user_venues
  has_many :venues, through: :user_venues

  validates :username, uniqueness: { case_sensitive: false }
  validates_uniqueness_of :username, :email
  include ActiveModel::Validations
  has_secure_password

  enum role: %w(default admin)

  def self.sign_in_from_omniauth(auth)
    ## Code from tutorial, want to customize more

    # find_by(
    #   provider: auth['provider'],
    #   uid:      auth['uid']
  #   ) || create_user_from_omniauth
  end

  def self.create_user_from_omniauth(auth)
    ## Code from tutorial, want to customize more

    # create(
    # provider: auth['provider'],
    # uid: auth['uid'],
    # name: auth['info']['name']
    #   )

    ## Code from another tutorial

    # where(auth.slice(:provider, :uid)).first_or_create do |user|
    #   user.provider = auth.provider
    #   user.uid = auth.uid
    #   user.username = auth.info.nickname
    # end
  end

  def self.sign_in_from_app_credentials(auth)
  #  find_by(
  #    params
  #  )
  end

  def self.create_user_from_app_credentials(auth)
  #  create(
  #   email:    auth['email'],
  #   username: auth['username'],
  #   params
  #  )
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
    # super && provider.blank?
  end

  def update_with_password(params, *options)
    # if encrypted_password.blank?
    #   update_attributes(params, *options)
    # else
    #   super
    # end
  end

end
