require "test_helper"

class JobRequestTest < ActiveSupport::TestCase

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)          
  end

  test "should be valid" do
    assert @job.valid?
  end

  test "necessary skills can not also be desirable" do
    @job.skills_necessary = ['construction']
    assert_not @job.valid?
  end

  test "vacancies count should be present" do
    @job.vacancies_count = nil
    assert_not @job.valid?
  end

  test "end date can not be before start date" do
    @job.start_date = Date.today + 5
    @job.end_date = Date.today + 3
    assert_not @job.valid?
  end

  test "category should be present" do
    @job.category = nil
    assert_not @job.valid?
  end

  test "job function should be present" do
    @job.job_function = nil
    assert_not @job.valid?
  end


  
 
end
