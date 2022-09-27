class Candidacy < ApplicationRecord
    belongs_to :worker
    belongs_to :job_request
    has_many :placement

end
