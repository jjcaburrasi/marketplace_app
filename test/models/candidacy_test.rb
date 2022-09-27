require "test_helper"

class CandidacyTest < ActiveSupport::TestCase
  
    def setup
       @candidacy = Candidacy.new
    end
  
    test "should be valid" do
      assert @candidacy.valid?
    end
    
    test "worker_id should be present" do
      @candidacy.worker_id = nil
      assert_not @candidacy.valid?
    end
  
    test "job_request_id should be present" do
      @candidacy.job_request_id= nil
      assert_not @candidacy.valid?
    end
end
