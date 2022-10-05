class Placement < ApplicationRecord
    belongs_to :client
    belongs_to :candidacy
    belongs_to :worker
    belongs_to :job_request
end

def active_placements
    @active_placements=Placement.where(job_request: @job).where("end_date > ?", Date.today)
end
