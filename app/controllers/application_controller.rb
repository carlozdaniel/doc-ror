class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate, if: -> { request.format.json? }
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    {locale: I18n.locale}
  end



  def authenticate!
    @current_user || render_anauthorized
  end

  protected
    def authenticate
      authenticate_token
    end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_key: token)
    end
  end
  def render_anauthorized
    render json: {error: 'you need to sign uo before continuing...'}, status: :unauthorized
  end
end
