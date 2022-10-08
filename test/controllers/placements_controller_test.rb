require "test_helper"

class PlacementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)  
    @admin=admins(:admin)      
  end
 
  test "admin should see placement index" do
    sign_in @admin
    get placements_path
    assert_response :success
  end
end
