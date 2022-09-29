class CandidaciesController < ApplicationController
    before_action :authorized?, only: [:index]

    def new
        @candidacy = Candidacy.new
    end

    def create
        @job = JobRequest.find(params[:job_request_id])
        @candidacy = Candidacy.new
        @candidacy.worker = current_worker
        @candidacy.job_request = @job
        if @candidacy.save
            redirect_to job_requests_path, notice: "Application was successfully created."
          else
            redirect_to job_request_path(@job), notice:"Could not be created"
        end
    end

    def index
        @candidacies = Candidacy.all
    end

    private
    def application_params
      params.require(:candidacy).permit(:status, :start_date)
    end

    def authorized?
        return unless !current_admin
        redirect_to root_path, alert: 'Page not found'
    end
end
