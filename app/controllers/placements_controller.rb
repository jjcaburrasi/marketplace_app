class PlacementsController < ApplicationController
    before_action :authorized?, only: [:index]
    def index
        @current_placements = Placement.where("end_date > ?", Date.today)
        @old_placements = Placement.where("end_date < ?", Date.today)
    end

    def show
        @placement = Placement.find(params[:id])
    end
end
 private

 def authorized?
    return unless !current_admin
    redirect_to root_path, alert: 'Page not found'
end