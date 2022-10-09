require "test_helper"

class JobRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)  
    @admin = admins(:admin)   
    @worker = workers(:jose)     
  end

  test "all above test in one" do
    # test "visitor should get jobs index"
      get job_requests_path
      assert_response :success
    # test "clients should create job_request" do
      sign_in @client
      get new_job_request_path
      assert_response :success
      sign_out @client
    # test "worker should not be able to add new job"
      sign_in @user
      get new_job_request_path
      assert_redirected_to job_requests_path
      sign_out @user
    # test "visitor should not be able to add new job" do
      get new_job_request_path
      assert_redirected_to root_path
    # test "admin should not be able to add new job" do
      sign_in @admin
      get new_job_request_path
      assert_redirected_to job_requests_path
      sign_out @admin
    # test "clients should edit job_request" do
      sign_in @client
      get job_request_path(@job.id)
      assert_response :success
  end

  # test "should get jobs index" do
  #   get job_requests_path
  #   assert_response :success
  # end

  # test "clients should create job_request" do
  #     sign_in @client
  #     get new_job_request_path
  #     assert_response :success
  # end

  # test "worker should not be able to add new job" do
  #   sign_in @user
  #   get new_job_request_path
  #   assert_redirected_to job_requests_path
  # end

  # test "visitor should not be able to add new job" do
  #   get new_job_request_path
  #   assert_redirected_to root_path
  # end

  # test "admin should not be able to add new job" do
  #   sign_in @admin
  #   get new_job_request_path
  #   assert_redirected_to job_requests_path
  # end

#   test "clients should edit job_request" do
#     sign_in @client
#     get job_request_path
#     assert_response :success
# end




end
