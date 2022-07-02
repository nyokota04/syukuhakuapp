class ReservesController < ApplicationController
  before_action :authenticate_user!

  def index
    @reserves = Reserve.all
    @user = current_user
  end

  def new
    @reserve = Reserve.new(reserve_params)
    # @reserve = Reserve.find(params[:id])
    @days = (@reserve.end_date - @reserve.start_date).to_i
    @room = Room.find(params[:reserve][:room_id])
  end

  def create
    #  binding.pry
    @room = Room.find(params[:reserve][:room_id])
    @reserve = Reserve.new(reserve_params)
    # binding.pry
    if @reserve.save
      Reserve.new(reserve_params)
      redirect_to new_reserf_path
    else
      render :new
    end
   
    
    # @room = Room.find_by(room_id: params[:room_id])
    # binding.pry
  end

  def show
  end

    private
  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :people, :room_id, :user_id, :room_id).merge(user_id: current_user.id, room_id: (params[:reserve][:room_id]))
  end

end


