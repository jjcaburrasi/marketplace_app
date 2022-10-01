class WorkersController < ApplicationController
    def show
        @worker = Worker.find(params[:id])
    end

    def index
        @workers = Worker.all
    end
    def search_workers  
        @workers = Worker.where(skills: params[:skills])
    end

    private
    def worker_params
        params.require(:worker).permit(:name, :email, :password, :password_confirmation, skills: [])
    end
end
