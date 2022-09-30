class CandidaciesController < ApplicationController
    # before_action :authorized?, only: [:index]
    # JobRequest.all.each do |job|
    #     irb(main):007:1*   pp  job.skills.intersection(skills).size
    #     irb(main):008:0> end

    def new
        @candidacy = Candidacy.new
    end

    def create
        @job = JobRequest.find(params[:job_request_id])
        @candidacy = Candidacy.new
        @candidacy.worker = current_worker
        @candidacy.job_request = @job
        @candidacy.start_date = @job.start_date
        if !current_worker.working?
            if @candidacy.save
                flash[:success] = "Application was successfully created."
                redirect_to job_requests_path
            else
                flash[:danger] = "Could not be created"
                redirect_to job_request_path(@job)
            end
        else
            flash[:danger] = "You are already working, you can not apply to a job"
            redirect_to job_request_path(@job)
           
        end
    end

    def index
        @candidacies = Candidacy.all
    end

    def edit
        @candidacy = Candidacy.find(params[:id])
    end

    def update
        @candidacy = Candidacy.find(params[:id])
        @job = @candidacy.job_request
        if @candidacy.update(candidacy_params)
            redirect_to candidacies_path, notice: "Status updated."
        end
        if @candidacy.status == 'Hired'
            @candidacy.worker.update(working:true)
            @job.update(vacancies_count: @job.vacancies_count-1)
            Placement.create(job_request: @job, client: @job.client, client: @job.client, worker: @candidacy.worker, candidacy: @candidacy, start_date: @job.start_date, end_date: @job.end_date, monthly_salary: @job.monthly_salary)
            change_status(@candidacy)
        end
    end

    def change_status(candidacy)
        candidacy.update(status: 'Inactive')
        candidacy.save
    end

    private
    def candidacy_params
      params.require(:candidacy).permit(:status, :start_date)
    end

    def authorized?
        return unless !current_admin
        redirect_to root_path, alert: 'Page not found'
    end
end
