require "test_helper"

class JobRequestsIndexTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    def setup
        @admin = admins(:admin)
        @client = clients(:client1)
        @worker = workers(:jose)
    end
    
    test "job requests index as admin" do
        sign_in @admin
        get job_requests_path
        assert_response :success
        assert_select 'h2'
        assert_select 'div.cards'
        assert_select 'div.card'
        assigns(:jobs).each do |job|
            assert_select 'a[href=?]', job_request_path(job), text: 'More information' 
        end 
        assigns(:jobs).each do |job|
            assert_select 'a[href=?]', job_request_candidacies_path(job), text: 'Manage job' 
        end 
    end

    test "job requests index as client" do
        sign_in @client
        get job_requests_path
        assert_select 'div.cards'
        assert_select 'div.card', count: @client.job_requests.count
        assigns(:jobs).each do |job|
            assert_select 'a[href=?]', job_request_path(job), text: 'More information'
        end
    end

    test "job requests index as worker" do
        sign_in @worker
        get job_requests_path
        assert_select 'h2'
        assert_select 'div.cards'
        assert_select 'div.card'
        assigns(:jobs).each do |job|
            assert_select 'a[href=?]', job_request_path(job), text: 'Apply for this job' 
            assert_select 'p'
        end 
    end

    test "job requests index as visitor" do
        get job_requests_path
        assert_select 'h2'
        assert_select 'div.cards'
        assert_select 'div.card'
        assigns(:jobs).each do |job|
            assert_select 'a'
            assert_select 'p'
        end 
    end
end