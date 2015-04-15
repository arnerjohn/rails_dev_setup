class RidesController < ApplicationController
  respond_to :json
  before_action :set_ride, only: [:show, :update, :destroy]

  def index
    @rides = Ride.all


    respond_to do |format|
      format.html { render :index }
      format.json { render json: @rides }
    end
  end

	# HTML /rides/:id
	# JSON /api/v1/rides/:id
  def show
		@ride = Ride.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @ride }
		end
  end

  def update
    if @ride.update(ride_params)
      respond_with @ride
    else
      respond_with @ride.errors
    end
  end

  def destroy
    @ride.destroy

    respond_with :success
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)

    if @ride.save
			flash[:success] = "Ride Successfully created"
			respond_to do |format|
				format.html { redirect_to @ride }
				format.json { render json: @ride }
			end
      # respond_with @ride
    else
			flash[:error] = "Unable to create ride"
			respond_to do |format|
				format.html { render "new" }
				format.json { render json: @ride.errors }
			end
      # respond_with @ride.errors
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ride
    @ride = Ride.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ride_params
    params.require(:ride).permit(:RideName, :RideSponsorId, :RideDate, :RideLaunchTime, :RideStartLocation, :RideLength, :RidePace, :RideTerrain, :RideLeader, :Description)
  end
end

# "RideName"
# t.integer  "RideSponsorId"
# t.datetime "RideDate"
# t.datetime "RideLaunchTime"
# t.string   "RideTerrain"
# t.integer  "RideLeader"
# t.string   "Description"
