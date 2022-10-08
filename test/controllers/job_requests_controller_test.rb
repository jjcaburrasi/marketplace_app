require "test_helper"

class JobRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)  
    @admin = admins(:admin)        
  end


  test "should get jobs index" do
    get job_requests_path
    assert_response :success
  end



end
