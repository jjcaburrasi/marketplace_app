class Candidacy < ApplicationRecord
    acts_as_readable on: :created_at
    belongs_to :worker
    belongs_to :job_request
    has_many :placements, dependent: :destroy
    validates :worker, uniqueness: {scope: :job_request, message: 'Application already exists'}

end
