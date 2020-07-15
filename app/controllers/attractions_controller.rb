class AttractionsController < ApplicationController
  def index
    @attractions=Attraction.all
  end

  def new
    @attraction=Attraction.new
  end

  def show
    @attraction=Attraction.find(params[:id])
    @ride=Ride.create(attraction_id:@attraction.id,user_id:current_user.id)
  end

  def edit
    @attraction=Attraction.find(params[:id])
  end

  def update
    @attraction=Attraction.find(params[:id])
    @attraction.update(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  def create
    @attraction=Attraction.create(attractions_params)
    if @attraction
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def attractions_params
    params.require(:attraction).permit(:name,:tickets,:nausea_rating,:happiness_rating,:min_height)
  end
end
