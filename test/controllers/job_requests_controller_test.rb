require "test_helper"

class JobRequestsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)          
  end
  
  test "client should add new job" do
    sign_in @client
    get new_job_request_path
    assert_response :success
  end
end
