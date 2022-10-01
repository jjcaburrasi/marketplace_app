class Worker < ApplicationRecord

has_many :candidacies, dependent: :destroy
has_many :job_requests, through: :candidacies
has_many :placements, dependent: :destroy
validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
def applied?(job)
  job_requests.include?(job)
end

def fit_rate (job, worker)
  counter = 0.0
  skills_worker = worker.skills
  skills_job = job.skills
  skills_must_job = job.skills_necessary
  a1= Set.new(skills_worker)
  a2= Set.new(skills_must_job)
  compare_skills=a2.subset?(a1)
  if !compare_skills
      0
  else
      skills_worker.each do |skill|
          if skills_job.include?(skill)
              counter+=1
          end
      end
  end
  final_counter= ((counter/skills_job.count)*100).round(2)
end

end
