class Ride < ActiveRecord::Base
	# belongs_to :distance
	# belongs_to :location
	# belongs_to :pace
	# has_one :rider

	has_many :ride_participations
	has_many :riders, through: :ride_participations
end
