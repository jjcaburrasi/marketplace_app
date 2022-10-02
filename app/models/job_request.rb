class JobRequest < ApplicationRecord
    attr_accessor :fit_ratio
    belongs_to :client
    has_many :candidacies, dependent: :destroy
    has_many :workers, through: :candidacies
    has_many :placements, dependent: :destroy
    validates :start_date, :end_date, presence: true
    validate :end_date_is_after_start_date
    validates :job_function, presence: true
    validates :vacancies_count, presence: true
    validates :monthly_salary, presence: true
    validate :necessary_skills_unique
    validate :start_date_in_the_past

    def applied?(worker)
        workers.include?(worker)
    end

    def self.find_jobs(job_search)
        JobRequest.where("lower(job_function) LIKE ? ","%" + job_search + "%")
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
       return 0
    else
        skills_worker.each do |skill|
            if skills_job.include?(skill)
                counter+=1
            end
        end
    end
    final_counter= ((counter/skills_job.count)*100).round(2)
    end




    private
        def end_date_is_after_start_date
            if end_date < start_date
                errors.add(:end_date, 'cannot be before the start date')
            end
        end

        def necessary_skills_unique
            skills.each do |skill|
                if skills_necessary.include?(skill)
                    errors.add(:skills_necessary, 'skills necessary can not be also desirable')
                end
            end
        end

        def start_date_in_the_past
            if start_date < Date.today
                errors.add(:start_date, 'start date can not be in the past')
            end
        end
end
