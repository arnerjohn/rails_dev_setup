class RideParticipationsController < ApplicationController
	
	#
	# POST /ride_pariticpations
	# params[:rider_id]
	# params[:ride_id]
	#
	def create
		@participation = RideParticipation.create do |p|
			p.rider_id = params[:rider_id]
			p.ride_id = params[:ride_id]
		end

		if @participation.save
			respond_to do |format|
				format.html { redirect_to :back }
				format.json { render json: :success }
			end
		else
			respond_to do |format|
				format.html { redirect_to :back }
				format.json { render json: :error }
			end
		end
	end

	#
	# DELETE /ride_pariticpations/:id
	# params[:id]
	#
	def destroy
		@participation = RideParticipation.find(params[:id])
		@participation.delete
		redirect_to :back
	end
end
