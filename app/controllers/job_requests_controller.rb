class JobRequestsController < ApplicationController
    include ApplicationHelper
    def index
        @jobs = which_jobs
    end
end
