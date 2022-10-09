require "test_helper"

class WorkersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin)
    @client = clients(:client1)
    @worker1 = workers(:jose)
    @worker2 = workers(:sol)
    @job = job_requests(:job1)
    @candidacy = candidacies(:candidacy1)
  end

  test "clients only should see available workers" do
    sign_in @client
    get workers_path
    assert_select 'div.card', count = 1 
  end

  test "admins can see all workers" do
    sign_in @admin
    get workers_path
    assert_select 'div.card', count = 3
  end

  test "search workers gives right results" do
    sign_in @client
    get workers_path
    assert :success
    get search_workers_path, params: {skills: ["Spanish"]} 
    assert :success
    assert_select 'div.card', count=1
  end

  test "hiring will toggle working true" do 
    sign_in @admin
    get job_request_candidacies_path(@job)
    assert :success
    patch job_request_candidacy_path(@job, @candidacy), params: {candidacy:{status: "Hired"}}
    assert :success
    assert @candidacy.worker.working == true
  end

  test "hiring will toggle available false" do 
    sign_in @admin
    get job_request_candidacies_path(@job)
    assert :success
    patch job_request_candidacy_path(@job, @candidacy), params: {candidacy:{status: "Hired"}}
    assert :success
    assert @candidacy.worker.available == false
  end

  test "hiring will change vacances -1" do 
    sign_in @admin
    get job_request_candidacies_path(@job)
    assert :success
    a=@job.vacancies_count
    patch job_request_candidacy_path(@job, @candidacy), params: {candidacy:{status: "Hired"}}
    @job.reload
    assert @job.filled_vacancies,a-1
  end

  test "hiring will change filled_vacancies +1" do 
    sign_in @admin
    get job_request_candidacies_path(@job)
    assert :success
    a=@job.filled_vacancies
    patch job_request_candidacy_path(@job, @candidacy), params: {candidacy:{status: "Hired"}}
    @job.reload
    assert @job.filled_vacancies,a+1
  end

  # test "hiring will toggle candidacy inactive" do 
  #   sign_in @admin
  #   get job_request_candidacies_path(@job)
  #   assert :success
  #   patch job_request_candidacy_path(@job, @candidacy), params: {candidacy:{status: "Hired"}}
  #   assert :success
  #   assert @candidacy.worker.available == false
  #   sign_out @admin
  # end

end
