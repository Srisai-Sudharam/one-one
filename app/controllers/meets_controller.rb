class MeetsController < ApplicationController
  
  before_action :authenticate_employee!
  before_action :find_meet, only: [ :update, :destroy]
  load_and_authorize_resource



  def create
    
     Meet.create!(meet_params.merge(manager: current_employee))
      render json: {message: "meeting created successfully"}, status: :created
  end

  def update

      @meet.update!(meet_params)
        render json: {message: "meeting_details updated successfully"}
  end

  def destroy

    @meet.destroy!
      render json: {message: "meeting destroyed successfully"}
  end





  private 

  def find_meet
    @meet = Meet.find(params[:id])
  end

  
  def meet_params
    params.require(:meet).permit(:agenda, :employee_id)
  end


end
