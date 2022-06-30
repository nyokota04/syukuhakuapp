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
  end

  def create
    # @reserve = Reserve.new(reserve_params)
    # binding.pry
    if
      Reserve.new(reserve_params)
      redirect_to new_reserf_path
    else
      render root_path
    end
   
    @room = Room.find(params[:reserve][:room_id])
  end

  def show
  end

    private
  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :people).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
