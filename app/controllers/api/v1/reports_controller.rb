module Api
    module V1
      class ReportsController < ActionController::Base
        def index
          api_user = ApiUser.find_by(api_user: params[:api_user])
          if params[:token] == api_user.token
            @placements = Placement.all
            render json: @placements.to_json(include: [:client, :job_request])
          else
            render "api/index"
          end     
        end
      end
    end
  end