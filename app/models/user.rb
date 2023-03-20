class User < ApplicationRecord
    has_secure_password
    has_many :matches
    has_one :google_token
    has_one :apple_token
end
