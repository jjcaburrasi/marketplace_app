require "test_helper"

class WorkersControllerTest < ActionDispatch::IntegrationTest

    def setup
        @worker1 = workers(:sol)
        @worker2 = workers(:jose)
        @client = clients(:client1)
        @admin = admins(:admin)
        @job = job_requests(:job1)
    end

    test "worker should not see another workers profile" do
        sign_in @worker1
        get worker_path(@worker2)
        assert_redirected_to root_path
    end

    test "clients should see workers index" do
        sign_in @client
        get workers_path
        assert_response :success
    end

    test "workers should not see workers index" do
        sign_in @worker1
        get workers_path
        assert_redirected_to root_path
    end

    test "visitors should not see workers index" do
        get workers_path
        assert_redirected_to root_path
    end

    test "admins should see workers index" do
        sign_in @admin
        get workers_path
        assert_response :success
    end

    test "clients should see suggested workers for a specific job" do
        sign_in @client
        get job_request_suggestedworkers_path(@job)
        assert_response :success
    end

    test "workers should not see suggested workers" do
        sign_in @worker1
        get job_request_suggestedworkers_path(@job)
        assert_redirected_to new_client_session_path
    end

    test "admins should not see suggested workers" do
        sign_in @admin
        get job_request_suggestedworkers_path(@job)
        assert_redirected_to new_client_session_path
    end
 
 
end