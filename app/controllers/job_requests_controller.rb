class JobRequestsController < ApplicationController
    def index
        @jobs = JobRequest.all
    end
end
