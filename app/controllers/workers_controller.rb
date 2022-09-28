class WorkersController < ApplicationController
    # def show
    #     @worker = current_worker
    # end

    private
    def worker_params
        params.require(:worker).permit(:name, :email, :password, :password_confirmation, skills: [])
    end
end
