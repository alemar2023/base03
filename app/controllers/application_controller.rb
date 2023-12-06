class ApplicationController < ActionController::Base

  before_action :set_locale


  private

  def set_locale
    #user_locale = current_user&.locale
    if params[:locale].present?
      cookies.permanent[:locale] = params[:locale]
    end

    I18n.locale =  locale_from_cookie_header || I18n.default_locale
    cookies.permanent[:locale] = I18n.locale
  end

  def locale_from_cookie_header

    cookie_locale = cookies.permanent[:locale]
    available_locales = I18n.available_locales.map(&:to_s)

    if available_locales.include?(cookie_locale)
      cookie_locale

    else
      browser_locale = request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
      available_locales = I18n.available_locales.map(&:to_s)

      if available_locales.include?(browser_locale)
        browser_locale
      else
        "en"
      end
    end

  end






end
