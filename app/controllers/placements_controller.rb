class PlacementsController < ApplicationController
    def index
        @current_placements = Placement.where("end_date > ?", Date.today)
        @old_placements = Placement.where("end_date < ?", Date.today)
    end
end
