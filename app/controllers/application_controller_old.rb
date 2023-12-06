class ApplicationControllerOld < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language
      #elsif cookies[:locale].present?
      #I18n.locale = cookies[:locale]
    else
      I18n.locale = params[:lang] ||  extract_locale || locale_from_header || I18n.default_locale
    end
    cookies[:locale] = { value: I18n.locale.to_s, expires: 1.year.from_now }
    @cookie_value = cookies["locale"]
  end

  def check_first_opened_session

  end

  def locale_from_header
    # request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
    browser_locale = request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
    available_locales = I18n.available_locales.map(&:to_s)


    if available_locales.include?(browser_locale)
      browser_locale
    else
      "en"
    end

  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil

  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

=begin
  def changelocale
    if settings.language_supported?(params[:locale])
      session[:locale] = params[:locale]
      i18n.locale = params[:locale]
    end
    redirect_to request.referer.presence || root_path
  end

  def set_locale
    cookies[:user_locale] = params[:locale]
    redirect_back(fallback_location: root_path)
  end

  def read_locale
    @user_locale = cookies[:user_locale] || I18n.default_locale
    I18n.locale = @user_locale
  end
=end

end
