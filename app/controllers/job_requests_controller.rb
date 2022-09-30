class JobRequestsController < ApplicationController
    before_action :authorized?, except: [:index]
    before_action :can_create?, only: [:new, :create]
    before_action :can_update, only: [:edit, :update]
    include ApplicationHelper
    def index
        @jobs = which_jobs
    end

    def show
        @candidacy = Candidacy.new
        @job = JobRequest.find(params[:id]) 
    end

    def new
        @job = JobRequest.new
        @skills = skills
    end


    def create
        @job = JobRequest.new(jobrequest_params)
        @job.client = current_client
        if @job.save
            redirect_to job_requests_path, notice: "Job was successfully created."
        else
            redirect_to job_requests_path, notice:"Could not be created"
        end
    end

    def update
    end

    def destroy
        @job = JobRequest.find(params[:id])
        @job.destroy
        redirect_to job_requests_path, notice: 'Job succesfully destroyed',  status: :see_other 
    end

    private
        def authorized?
            return unless !someone_signed_in?
            redirect_to root_path
        end

        def can_create?
            return unless !current_client
            redirect to job_requests_path
        end

        def can_update?
            return unless !current_admin
        end

        def jobrequest_params
            params.require(:job_request).permit(:end_date, :start_date, :job_function, :address, :vacancies_count, :monthly_salary, skills:[])
        end

        def skills
            array_skills = ['Driving License', 'Tech', 'Construction', "Own motorcycle", "Work rotatory turn", "English",
            "Spanish", "Capacity to load heavy weights", "Disability certificate"]
        end
end
