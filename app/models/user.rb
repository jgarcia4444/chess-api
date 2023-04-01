require 'securerandom'
class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :matches
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: {minimum: 5}

  def self.signin_or_create_from_provider(provider_data)
    puts "DEFAULT USERNAME: #{provider_data[:info][:username]}"
    info_email = provider_data[:info][:email]
    user = User.find_by(email: info_email)
    uid = nil
    if user 
      uid = user.uid
    else
      uid = SecureRandom.uuid
    end
    where(provider: provider_data[:provider], uid: uid).first_or_create do |user|
      user.email = provider_data[:info][:email]
      user.username = provider_data[:info][:username]
      user.password = Devise.friendly_token[6, 20]
      user.skip_confirmation! 
    end
  end

end
