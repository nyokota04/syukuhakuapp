class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end


  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room)
    else
      render root_path
    end
    @room = Room.create params.require(:room).permit(:room_img)
  end

  def show
    @room = Room.find(params[:id])
    @reserve = Reserve.new
  end

  def edit
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_detail, :price, :address, :room_img)
  end
end
