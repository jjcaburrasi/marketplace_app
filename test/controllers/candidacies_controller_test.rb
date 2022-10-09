require "test_helper"

class CandidaciesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user=workers(:jose)
    @candidacy = candidacies(:candidacy1)
    @job=job_requests(:job2) 
    @client=clients(:client1)    
    @admin = admins(:admin)      
    @job_client = job_requests(:job1)
  end

  test "worker should create candidacy" do
    sign_in @user
    assert_difference('Candidacy.count',1) do
      post job_request_candidacies_url(@job, Candidacy.new), params: { candidacy: { job_request_id: @job.id }}
    end
  end

  test "visitor should not create candidacy" do
    assert_no_difference('Candidacy.count') do
      post job_request_candidacies_url(@job, Candidacy.new), params: { candidacy: { job_request_id: @job.id }}
    end
  end

  test "clients should not create candidacy" do
    sign_in @client
    assert_no_difference('Candidacy.count') do
      post job_request_candidacies_url(@job, Candidacy.new), params: { candidacy: { job_request_id: @job.id }}
    end
  end

  test "admins should not create candidacy" do
    sign_in @admin
    assert_no_difference('Candidacy.count') do
      post job_request_candidacies_url(@job, Candidacy.new), params: { candidacy: { job_request_id: @job.id }}
    end
  end



  test 'should update candidacy as an admin' do
    sign_in @admin
    patch job_request_candidacy_url(@candidacy.job_request, @candidacy), params: { candidacy: { status: 'new step'} }
    assert_redirected_to job_request_candidacies_path(@candidacy.job_request)
    @candidacy.reload
    assert_equal "new step", @candidacy.status
  end

  test 'workers should not update candidacy' do
    sign_in @user
    patch job_request_candidacy_url(@candidacy.job_request, @candidacy), params: { candidacy: { status: 'new step'} }
    assert_redirected_to root_path
  end

  test 'clients should not update candidacy' do
    sign_in @client
    patch job_request_candidacy_url(@candidacy.job_request, @candidacy), params: { candidacy: { status: 'new step'} }
    assert_redirected_to root_path
  end

  test 'visitors should not update candidacy' do
    
    patch job_request_candidacy_url(@candidacy.job_request, @candidacy), params: { candidacy: { status: 'new step'} }
    assert_redirected_to root_path
  end

  test 'should not be able to see candidacies index as visitor' do
    get job_request_candidacies_path(@job)
    assert_redirected_to root_path
  end

  test 'should get candidacies for a specific job as a client' do
    sign_in @client
    get job_request_candidacies_path(@job_client)
    assert_response :success
  end

  test 'should get candidacies for a specific worker' do
    sign_in @user
    get candidacies_path
    assert_response :success
  end


  
  











end
