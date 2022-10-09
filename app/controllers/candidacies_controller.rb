class CandidaciesController < ApplicationController
    before_action :authorized?, only: [:index]
    before_action :admin?, only: [:update]
    before_action :worker?, only: [:create]
   

    def new
        @candidacy = Candidacy.new
    end

    def create
        @job = JobRequest.find(params[:job_request_id])
        if CreateCandidacy.call(@job, current_worker, flash)
            redirect_to job_request_path(@job)
        end
    end

    def index
        if params[:job_request_id]
            @job = JobRequest.find(params[:job_request_id])
        end
        @candidacies = Candidacy.where(job_request_id: params[:job_request_id])
        if current_admin
            @candidacies.mark_as_read! :all, for: current_admin
        end
        @candidacies_0 = Candidacy.where(status: 'Application submitted').where(job_request_id: params[:job_request_id])
        @candidacies_1 = Candidacy.where(status: 'Interview').where(job_request_id: params[:job_request_id])
        @candidacies_2 = Candidacy.where(status: 'Hired').where(job_request_id: params[:job_request_id])
        @candidacies_3 = Candidacy.where(status: 'Rejected').where(job_request_id: params[:job_request_id])
    end

    def edit
        @candidacy = Candidacy.find(params[:id])
    end

    def update
        @candidacy = Candidacy.find(params[:id])
         if  UpdateCandidacy.call(@candidacy, candidacy_params)
            redirect_to job_request_candidacies_path(@candidacy.job_request)
            flash[:info] = "Status updated"
         else
            flash[:info] = "No status updated"
         end
    end


    def destroy
    end

    private
    def candidacy_params
      params.require(:candidacy).permit(:status, :start_date)
    end


    def authorized?
        return unless !someone_signed_in?
        redirect_to root_path, alert: 'Page not found'
    end

    def admin?
        return unless !current_admin
        redirect_to root_path, alert: 'Page not found'
    end

    def worker?
        return unless !current_worker
        redirect_to root_path, alert: 'Page not found'
    end


end
