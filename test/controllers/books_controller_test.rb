require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get books_new_url
    assert_response :success
  end

  test "should get indes" do
    get books_indes_url
    assert_response :success
  end

  test "should get show" do
    get books_show_url
    assert_response :success
  end
end
