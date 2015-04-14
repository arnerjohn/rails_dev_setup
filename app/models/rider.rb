class Rider < ActiveRecord::Base

  has_one :api_key, dependent: :destroy

  after_create :create_api_key

	has_many :emergency_contacts
	has_one :pel_profile
	has_one :cycling_prof
	belongs_to :ride
	belongs_to :peloton



  private

    def create_api_key
      ApiKey.create :rider => self
    end

end
