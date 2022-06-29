class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all.includes(:rooms)
  end

  def new
    @reserve = Reserve.new
  end

  def creae
    @reserve = Reserve.new(reserve_params)
    @room = Room.find(params[:reserve][:room_id])
   
    if @reserve.save
      redirect_to new_reserf_path
    else
      render root_path
    end
  end

  def show
  end

    private
  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :people)
  end

end
