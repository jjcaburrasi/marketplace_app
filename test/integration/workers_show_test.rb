require "test_helper"

class WorkersShowTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin)
    @client = clients(:client1)
    @worker1 = workers(:jose)
    @worker2 = workers(:sol)
    @job = job_requests(:job1)
    @candidacy = candidacies(:candidacy1)
  end

  test "see profile as worker" do
    sign_in @worker1
    get worker_path(@worker1)
    assert_select 'div.worker-card', count = 1
  end

  test "see profile as client" do
    sign_in @client
    get worker_path(@worker1)
    assert_select 'div.worker-card', count = 1
  end

  test "see profile as admin" do
    sign_in @admin
    get worker_path(@worker1)
    assert_select 'div.worker-card', count = 1
  end

end