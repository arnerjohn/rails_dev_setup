class EmergencyContactsController < ApplicationController
  respond_to :json
  before_action :set_econ, only: [:show, :update, :destroy]
  #before_action :authenticate, only: [:show, :update, :destroy]

  def index
    @econ = EmergencyContact.all
    respond_with @econ
  end

  # GET /riders/1
  # GET /riders/1.json
  def show
    #needs rider-permission for showing
    respond_with @econ
  end

  # POST /riders
  # POST /riders.json
  def create
    @econ = EmergencyContact.new(econ_params)

    if @econ.save
      respond_with @econ
    else
      respond_with @econ.errors
    end

  end

  # PATCH/PUT /riders/1
  # PATCH/PUT /riders/1.json
  def update
    #needs rider-permission for updating
    if @econ.update(econ_params)
      respond_with @econ
    else
      respond_with @econ.errors
    end

  end

  # DELETE /Riders/1
  # DELETE /Riders/1.json
  def destroy
    #needs Rider-permission for destroying
    @econ.destroy

    respond_with :success

  end

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @econ = EmergencyContact.where(api_key: token).first
    end
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_econ
    @econ = EmergencyContact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def econ_params
    params.permit(:EID, :Name, :Phone, :Relationship)
  end
end

# t.integer  "EID"
# t.string   "Name"
# t.integer  "Phone"
# t.string   "Relationship"