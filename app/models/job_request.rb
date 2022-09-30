class JobRequest < ApplicationRecord
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
