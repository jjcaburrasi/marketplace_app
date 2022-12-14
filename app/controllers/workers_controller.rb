class WorkersController < ApplicationController
    before_action :authorized_index?, only: [:index]
    before_action :authorized_show?, only: [:show]
    before_action :authenticate_client!, only: [:suggested_workers]
    def show
        @worker = Worker.find(params[:id])
    end

    def index
        if !current_admin
            @workers = Worker.where(available:true).where(rehirable: [true, nil]) 
        elsif
            @workers = Worker.all  
        end
    end

    def search_workers  
        all_workers = Worker.where(available: true)
        @workers=[]
        all_workers.each do |worker|       
            skills_worker = worker.skills
            skills_search = params[:skills]
            a1= Set.new(skills_worker)
            a2= Set.new(skills_search)
            compare_skills=a2.subset?(a1)
            if compare_skills
                @workers << worker
            
            end
        end
        @workers
    end

    def suggested_workers
        @job = JobRequest.find(params[:job_request_id])
        @workers = Worker.where(working: false).where(available:true).sort { |a,b| fit_rate(@job, a) <=> fit_rate(@job, b)}.reverse
        @workers = @workers.first(6)
    end

    def update
        @worker = Worker.find(params[:id])
        if @worker.update(worker_params)
            redirect_to worker_path(@worker)
        end
    end

    def inform_worker
        @worker = Worker.find(params[:worker_id])
        UserMailer.inform_worker(current_client, @worker).deliver_now
        flash[:info]="Email was sent"
        redirect_to request.referrer
    end

    private
    def worker_params
        params.require(:worker).permit(:name, :email, :password, :password_confirmation, :rehirable, :working, skills: [])
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

    def authorized_index?
        return unless !(current_client || current_admin)
        redirect_to root_path
    end

    def authorized_show?
        return unless !(current_client || current_admin || current_worker == Worker.find(params[:id]))
        redirect_to root_path
    end
end
