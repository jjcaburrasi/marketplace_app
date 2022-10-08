require "test_helper"

class PlacementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)  
    @placement = placements(:placement1)        
  end

  test "should be valid" do
    assert @placement.valid?
  end

  test "worker_id should be present" do
    @placement.worker_id = nil
    assert_not @placement.valid?
  end

  test "job_request_id should be present" do
    @placement.job_request_id= nil
    assert_not @placement.valid?
  end

  test "client id should be present" do 
    @placement.client_id = nil
    assert_not @placement.valid?
  end

  test "candidacy id should be present" do
    @placement.candidacy_id = nil
    assert_not @placement.valid?
  end

end
