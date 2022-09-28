class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def home
    end

   
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, skills: []])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        end

        # def after_sign_in_path_for(resource)
        #    @admin
        # end   

        # def after_sign_up_path_for(resource)
        #     @admin
        #  end  

        # def logged_in_user
        #     unless user_signed_in?
        #         flash[:danger] = "Please log in."
        #         redirect_to new_user_session_path
        #     end
        # end

        
        # def admin_user
        #     unless current_user.admin?
        #         flash[:danger] = "Please log in as admin user."
        #         redirect_to new_user_session_path
        #     end   
        # end
end
