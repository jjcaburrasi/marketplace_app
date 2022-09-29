class Candidacy < ApplicationRecord
    belongs_to :worker
    belongs_to :job_request
    has_many :placements
    validates :worker, uniqueness: {scope: :job_request, message: 'Application already exists'}

end
