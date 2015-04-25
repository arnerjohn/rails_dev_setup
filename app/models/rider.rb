class Rider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :api_key, dependent: :destroy

  after_create :create_api_key

	has_many :ride_participations
	has_many :rides, through: :ride_participations
	
	# has_many :emergency_contacts
	# has_one :pelotonia_profile
	# has_one :cycling_prof
	# belongs_to :ride
	# belongs_to :peloton



  private

    def create_api_key
      ApiKey.create :rider => self
    end

end
