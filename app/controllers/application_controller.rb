class ApplicationController < ActionController::Base

  before_action :set_locale

  private

  def set_locale
    @cook_a = ""
    @cook_b = ""
    @cook_c = ""
    @cook_d = ""
    @cook_e = ""
    @cook_f = ""
    if user_signed_in?
       I18n.locale = current_user.locale

      if params[:locale].present?
        @cook_a = "lang present"


          current_user.update(locale: params[:locale])
          I18n.locale = params[:locale]
          cookies.permanent[:locale] = I18n.locale
          @cook_b =  I18n.locale

      end
      #I18n.locale = locale_from_cookie_header || I18n.default_locale
      cookies.permanent[:locale] = I18n.locale

      @cook_c = "setto cookie locale permanent"
      @cook_d = I18n.locale
    else

      if params[:locale].present?
        I18n.locale = params[:locale]
        cookies.permanent[:locale] = params[:locale]
      else
        I18n.locale = locale_from_cookie_header || I18n.default_locale
        cookies.permanent[:locale] = I18n.locale
      end
    end
@cook_lang = params[:lang]
@cook_loc = params[:locale]
    @cook_e = I18n.locale
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


  def default_url_options
    { locale: ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end
end
