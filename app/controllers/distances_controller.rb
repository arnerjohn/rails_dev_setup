class DistancesController < ApplicationController
  before_action :set_distance, only: [:show, :update, :destroy]

  def show
    respond_to do |format|
      format.json { render json: @distance }
    end
  end

  def update
    respond_to do |format|
      if @distance.update(distance_params)
        format.json { render json: @distance }
      else
        format.json { render json: @distance.errors }
      end
    end

  end

  def destroy
    @distance.destroy

    respond_to do |format|
      format.json { render json: :success }
    end
  end

  def create
    @distance = Distance.new(distance_params)
    respond_to do |format|
      if @distance.save
        format.json { render json: @distance }
      else
        format.json { render json: @distance.errors }

      end
    end

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_distance
    @distance = Distance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def distance_params
    params.permit(:RideID, :Distance)
  end
end


# "RideName"
# t.integer  "RideID"
# t.float    "Distance"