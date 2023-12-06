class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def update_locale
    current_user.update(locale: params[:locale])
    cookies[:locale] = params[:locale]
    redirect_back(fallback_location: root_path)
  end

  def update_user_language
    locale = params[:locale].to_s.strip.downcase
    if locale.present? && I18n.items_available_locales.include?(locale.to_sym)
      cookies.permanent[:locale] = locale
      current_user&.update(locale: locale)
    end
  end
  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url, notice: "Updated User."
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url, notice: "User succesfully created!"
    else
      render :new
    end
  end






  private

  def user_params
    params.require(:user).permit(:email, :locale, :password, :password_confirmation)
  end
end