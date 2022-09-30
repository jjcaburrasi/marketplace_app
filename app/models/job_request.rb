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

    def applied?(worker)
        workers.include?(worker)
    end

    private
        def end_date_is_after_start_date
            if end_date < start_date
                errors.add(:end_date, 'cannot be before the start date')
            end
        end
end
