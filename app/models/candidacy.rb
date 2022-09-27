class Candidacy < ApplicationRecord
belongs_to :worker, class_name: "Worker"
belongs_to :job_request , class_name: "JobRequest"
belongs_to :placement, class_name: "Placement"

validates :worker_id, presence: true
validates :job_request_id, presence: true
end
