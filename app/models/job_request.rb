class JobRequest < ApplicationRecord
    belongs_to :client
    has_many :candidacies, dependent: :destroy
    has_many :workers, through: :candidacies
end
