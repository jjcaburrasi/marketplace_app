class CreateCandidacy < ApplicationService
    def initialize(job, worker, flash)
        @job = job
        @worker = worker
        @flash = flash
    end

    def call
        @candidacy = Candidacy.new
        @candidacy.worker = @worker
        @candidacy.job_request = @job
        @candidacy.start_date = @job.start_date
        if !@worker.working?
            a1= Set.new(@worker.skills)
            a2= Set.new(@job.skills_necessary)
            compare_skills=a2.subset?(a1)
            if !compare_skills
                @flash[:danger] = "You don't have the required skills"
                
            else
                if @candidacy.save
                    @flash[:success] = "Application was successfully created."
                    UserMailer.application_submitted(@worker, @candidacy).deliver_now
                    return true
                else
                    @flash[:danger] = "Could not be created"
                   
                    return 'error'
                end
            end
        else
            @flash[:danger] = "You are already working, you can not apply to a job"
            return 'working'
        
        end
    end
end