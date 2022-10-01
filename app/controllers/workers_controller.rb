class WorkersController < ApplicationController
    def show
        @worker = Worker.find(params[:id])
    end

    def index
        @workers = Worker.all
    end
    def search_workers  
        @workers = Worker.where(skills: params[:skills])
    end

    def suggested_workers
        @job = JobRequest.find(params[:job_request_id])
        @workers = Worker.all.sort { |a,b| fit_rate(@job, a) <=> fit_rate(@job, b)}.reverse
        @workers = @workers.first(6)
    end

    private
    def worker_params
        params.require(:worker).permit(:name, :email, :password, :password_confirmation, skills: [])
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
