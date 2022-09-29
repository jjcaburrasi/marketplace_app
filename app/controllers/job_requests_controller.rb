class JobRequestsController < ApplicationController
    before_action :authorized?, except: [:index]
    include ApplicationHelper
    def index
        @jobs = which_jobs
    end

    def show
        @candidacy = Candidacy.new
        @job = JobRequest.find(params[:id]) 
    end

    def create
    end

    def update
    end

    private
        def authorized?
            return unless !someone_signed_in?
            redirect_to root_path
        end
end
