class Candidacy < ApplicationRecord
belongs_to :worker
belongs_to :job_request
belongs_to :placement

end
