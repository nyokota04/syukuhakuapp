class ReservesController < ApplicationController
  before_action :authenticate_user!

  def index
    # binding.pry
    @reserves = Reserve.all
    @user = current_user
    # binding.pry
    @rooms = Room.all
    # binding.pry
  
  end

  def new
    # binding.pry
    @room = Room.find(params[:reserve][:room_id])
    @reserve = Reserve.new(reserve_params)
    @price = @room.price * @reserve.people * (@reserve.end_date - @reserve.start_date).to_i
    @days =  (@reserve.end_date - @reserve.start_date).to_i
    
  end

  def create
    #  binding.pry
    @room = Room.find(params[:reserve][:room_id])
    @reserve = Reserve.new(reserve_params)
    # binding.pry
    if @reserve.save
      @room = Room.find(params[:reserve][:room_id])
      Reserve.new(reserve_params)
      @price = @room.price * @reserve.people * (@reserve.end_date - @reserve.start_date).to_i
      redirect_to reserf_path(@reserve.id)
    else
      render :new
    end
    # binding.pry
  end

  def show
    # binding.pry
    @reserve = Reserve.find(params[:id])
    @price = @reserve.room.price * @reserve.people * (@reserve.end_date - @reserve.start_date).to_i

  end

    private
  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :people, :room_id, :user_id).merge(user_id: current_user.id, room_id: (params[:reserve][:room_id]))
  end

end


