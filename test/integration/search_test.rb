require "test_helper"

class SearchTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin)
    @client = clients(:client1)
    @worker1 = workers(:jose)
    @worker2 = workers(:sol)
  end

  test "search job gives right results" do 
    sign_in @worker1
    get job_requests_path
    assert :success
    get search_jobs_path, params: {content:"job"}
    assert :success
    assert_select 'div.card', count=1
  end
  
end
