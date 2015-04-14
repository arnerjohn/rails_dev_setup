include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  private

  def restrict_access
    unless  restrict_access_by_header
      render json: {message: 'Invalid API Token'}, status: 401
      return
    end

    @rider = @api_key.rider if @api_key
  end

  def restrict_access_by_header
    return true if @api_key

    authenticate_with_http_token do |token|
      @api_key = ApiKey.where({ access_token: (token) })
      byebug
    end
  end

end