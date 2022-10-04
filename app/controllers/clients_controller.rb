class ClientsController < ApplicationController
  def show
  end

  def myworkers
      @present_client_placement = Placement.where("end_date > ?", Date.today).where("client_id = ?", params[:client_id])
      @past_client_placement = Placement.where("end_date < ?", Date.today).where("client_id = ?", params[:client_id])
  end

  
end
