class RideParticipation < ActiveRecord::Base
	belongs_to :ride
	belongs_to :rider
end
