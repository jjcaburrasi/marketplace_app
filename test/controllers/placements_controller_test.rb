require "test_helper"

class PlacementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    # @job=job_requests(:job1) 
    @client=clients(:client1)  
    @admin=admins(:admin)        
    @job_client = job_requests(:job1)  
  end
 
  test "admin should see placement index" do
    sign_in @admin
    get placements_path
    assert_response :success
  end

  # test "client should see placement index for specific job" do
  #   sign_in @client
  #   get placements_path(@job_client)
  #   assert_response :success
  # end

  # test 'visitor should not be able to see placement index' do
  #   get placements_path
  #   assert_redirected_to root_path
  # end

  

  # test "not admin should not see placement index" do
  #   sign_in @user
  #   get placements_path
  #   assert_response :success
  # end
end
