class ApiUser < ApplicationRecord
    validates :api_user, presence: true
    validates :token, presence: true
    
end
