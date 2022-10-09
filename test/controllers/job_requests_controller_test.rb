require "test_helper"

class JobRequestsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)  
    @admin = admins(:admin)   
    @worker = workers(:jose)     
  end


  test "should get jobs index" do
    get "/jobs"
    assert_response :success
  end




end
