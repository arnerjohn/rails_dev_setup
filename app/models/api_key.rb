class ApiKey < ActiveRecord::Base
  before_create :generate_access_token
  validates_uniqueness_of :access_token

  belongs_to :rider

  def get_rider_id
    self.rider_id
  end

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex.to_s
    end while self.class.exists?(access_token: access_token)
  end
end
