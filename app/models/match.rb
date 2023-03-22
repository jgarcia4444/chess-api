class MatchValidator < ActiveModel::Validator
    def validate(record)
        if User.find_by(id: record.winning_user_id) == false
            record.errors.add :winning_user_id, "Winning user id must be associated with a valid user."
        end
        if User.find_by(id: record.losing_user_id) == false
            record.errors.add :losing_user_id, "Losing user id must be associated with a valid user."
        end
    end
end


class Match < ApplicationRecord
    include ActiveModel::Validations
    validates :game_duration, presence: true, numericality: {greater_than: 1}
    validates :winning_user_id, presence: true
    validates :losing_user_id, presence: true
    validates_with MatchValidator
end

