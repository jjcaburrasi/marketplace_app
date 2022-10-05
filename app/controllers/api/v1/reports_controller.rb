module Api
    module V1
      class ReportsController < ActionController::Base
        def index
          api_user = ApiUser.find_by(api_user: params[:api_user])
          if params[:token] == api_user.token
            @placements_done = Placement.where("end_date < ?", Date.today)
            render json: @placements_done, include: [:client, :job_request]
          else
            render "api/index"
          end     
        end
      end
    end
  end