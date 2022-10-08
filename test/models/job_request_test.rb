require "test_helper"

class JobRequestTest < ActiveSupport::TestCase

  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)          
  end

  
 
end
