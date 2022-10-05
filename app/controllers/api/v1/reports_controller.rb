module Api
    module V1
      class ReportsController < ActionController::Base
        def index
          api_user = ApiUser.find_by(api_user: params[:api_user])
          p api_user.token
          p params[:token]
          if params[:token] == api_user.token
            @placements_done = Placement.where("end_date < ?", Date.today)
            render json: @placements_done
          else
            render "api/index"
          end
          
        end
        # before_action :check_basic_auth
        # skip_before_action :verify_authenticity_token

        # private
        # def check_basic_auth
        #   unless request.authorization.present?
        #     head :unauthorized
        #     return
        #   end
        #   authenticate_with_http_basic do |email, password|
        #     user = User.find_by(email: email.downcase)
        #     if user && user.authenticate(password)
        #       @current_user = user
        #     else
        #       head :unauthorized
        #     end
        #   end
        # end
        # def current_user
        #   @current_user
        # end
      end
    end
  end