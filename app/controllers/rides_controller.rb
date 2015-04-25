class RidesController < ApplicationController
  respond_to :json
  # before_action :set_ride, only: [:show, :update, :destroy]

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

	def edit
		@ride = Ride.find(params[:id])
	end

  def update
		@ride = Ride.find(params[:id])

		if @ride.update(ride_params)
			message = "Ride updated!"
			flash[:success] = message
			respond_to do |format|
				format.html { redirect_to @ride }
				format.json { render json: { message: message, ride: @ride } }
			end
			# respond_with @ride
		else
			message = "Unable to Update Ride"
			flash[:error] = message
			respond_to do |format|
				format.html { render "edit" }
				format.json { render json: { message: message }, status: 500 }
			end
			# respond_with @ride.errors
		end
  end

  def destroy
		@ride = Ride.find(params[:id])

    @ride.destroy

		respond_to do |format|
			format.html { redirect_to :back }
			format.json { respond_with :success }
		end
		
    # respond_with :success
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
  # def set_ride
  #   @ride = Ride.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ride_params
    params.require(:ride).permit(:name, :date, :launch_time, :terrain, :description)
  end
end

# create_table "rides", force: :cascade do |t|
#   t.string   "name",        limit: 255
#   t.datetime "date"
#   t.datetime "launch_time"
#   t.string   "terrain",     limit: 255
#   t.string   "description", limit: 255
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "rider_id"
# end
