class User < ApplicationRecord
    has_secure_password
    has_many :matches
    has_one :google_token
    has_one :apple_token
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: {minimum: 5}
    validates :password, presence: true, length: {minimum: 6}
end
