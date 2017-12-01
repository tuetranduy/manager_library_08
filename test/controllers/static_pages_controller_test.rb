require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get author" do
    get static_pages_author_url
    assert_response :success
  end

  test "should get publisher" do
    get static_pages_publisher_url
    assert_response :success
  end
end
