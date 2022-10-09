class UpdateCandidacy < ApplicationService
    def initialize(candidacy, params)
        @candidacy = candidacy
        @params = params
    end

    def call
        @job = @candidacy.job_request
        if @candidacy.update(@params)
            UserMailer.change_status(@candidacy.worker, @candidacy).deliver_now
            if @candidacy.status == 'Hired'
                @candidacy.worker.update(working:true)
                @candidacy.worker.update(available:false)
                @job.update(vacancies_count: @job.vacancies_count - 1)
                @job.update(filled_vacancies: @job.filled_vacancies + 1)
                @job.save
                    if @job.vacancies_count == 0
                        UserMailer.client_full_vacancies(@candidacy, @job.client).deliver_now
                    end
                
                Placement.create(job_request: @job, client: @job.client, worker: @candidacy.worker, candidacy: @candidacy, start_date: @job.start_date, end_date: @job.end_date, monthly_salary: @job.monthly_salary)
                change_status(@candidacy.worker.candidacies.where.not(id: @candidacy.id))
               
            end
            if @candidacy.status == 'Rejected'
            UserMailer.reject_candidate(@candidacy.worker, @candidacy.job_request).deliver_now
            end
            return true
 
        else
            return false
        end
        
    end

    private
        def change_status(candidacies)
            candidacies.each do |candidacy|
                candidacy.update(status: 'Inactive')
                candidacy.save
            end
        end
end