require "test_helper"

class CandidaciesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)          
  end

  # test "should create candidacy" do
  #   sign_in @user
  #   assert_difference 'Candidacy.count' do
  #     job_request_candidacies_url(@job)
  #   end
  # end









end
