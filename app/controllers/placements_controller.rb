class PlacementsController < ApplicationController
    
    before_action :authorized?, only: [:index, :update]

    def index
        if params[:job_request_id]
            @job = JobRequest.find(params[:job_request_id])
            @current_placements = Placement.where(job_request: @job).where("end_date > ?", Date.today)
            @old_placements = Placement.where(job_request: @job).where("end_date < ?", Date.today)
        else
            @current_placements = Placement.where("end_date > ?", Date.today)
            @old_placements = Placement.where("end_date < ?", Date.today)
        end
    end

    def show
        @placement = Placement.find(params[:id])
    end

    def update
        @placement = Placement.find(params[:id])
        if @placement.update(placement_params)
            redirect_to placement_path(@placement), notice: "Date updated."
        end
    end


    private

    def placement_params
        params.require(:placement).permit(:end_date)
    end

    def authorized?
        return unless !(current_admin || current_client)
        redirect_to root_path, alert: 'Page not found'
    end

end