class CookiesController < ApplicationController
  def create
    cookies["test_cookie"] = "delicious cookie"
    cookies["locale"] = ""
  end

  def show
    @cookie_value = cookies["test_cookie"]
    @cookie_valuex = cookies["locale"]
  end
end