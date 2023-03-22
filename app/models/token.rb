class TokenValidator < ActiveModel::Validator
    def validate(record)
        expires_at = record.expires_at
        if expires_at.respond_to?(:strftime) == false
            record.errors.add :expires_at, "Expires at must be a datetime data type."
        end
    end
end


class Token < ApplicationRecord
    include ActiveModel::Validations
    belongs_to :user
    validates :access_token, presence: true, length: {minimum: 1}
    validates :refresh_token, presence: true, length: {minimum: 1}
    validates :expires_at, presence: true
    validates :user_id, presence: true
    validates :is_google_token, presence: true
    validates_with TokenValidator
end
