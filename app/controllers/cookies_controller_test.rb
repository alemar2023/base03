require "test_helper"

class CookiesControllerTest < ActionDispatch::IntegrationTest
  test "should set a cookie" do
    get set_cookie_path
    assert_response :success
    assert_equal "delicious cookie", cookies["test_cookie"]
  end

  test "should get the cookie" do
    get get_cookie_path, headers: { "Cookie" => "test_cookie=oreo" }
    assert_response :success
    # assuming the server set the "new_cookie"
    assert_equal "oreo",  @response.cookies["new_cookie"]
  end
end