include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  private

  def restrict_access
    unless restrict_access_by_header
      render json: {message: 'Invalid API Token'}, status: 401
      return
    end
    @rider = Rider.find(@api_key) if @api_key
  end

  def restrict_access_by_header
    return @api_key if @api_key
    authenticate_with_http_token do |token|
      token.slice! 'token:'
      @api_key = ApiKey.where({ access_token: (token) }).first
      return @api_key
    end
  end

end