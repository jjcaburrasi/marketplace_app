require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clients_show_url
    assert_response :success
  end
end
