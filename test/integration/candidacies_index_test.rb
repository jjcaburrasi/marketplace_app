require "test_helper"

class CandidaciesIndexTest < ActionDispatch::IntegrationTest
    def setup
        @admin = admins(:admin)
        @candidacies = candidacies
        @job = job_requests(:job1)
        @worker = workers(:jose)
    end

    test "should get all candidacies for specific job as admin" do
        sign_in @admin
        get job_request_candidacies_path(@job)      
    end


    test "should get all worker candidacies when signed in as worker" do
        sign_in @worker
        get candidacies_path
        assert_select 'div.card', count = @worker.candidacies.count
       
    end

end