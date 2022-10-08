require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user=workers(:jose)
    @app = candidacies(:candidacy1)
    @job=job_requests(:job1) 
    @client=clients(:client1)          
   
  end
  test "application_submitted" do 
    mail = UserMailer.application_submitted(@user, @app)
    assert_equal "Application submitted", mail.subject
    assert_equal ["jjc@example.com"], mail.to
    assert_equal ['jjcaburrasi@gmail.com'], mail.from
    assert_match "Hello", mail.body.encoded
  end

  test "change_status" do 
    mail = UserMailer.change_status(@user, @app)
    assert_equal "Change status", mail.subject
    assert_equal ["jjc@example.com"], mail.to
    assert_equal ['jjcaburrasi@gmail.com'], mail.from
    assert_match "Hello", mail.body.encoded
  end

  test "reject_candidate" do
    mail = UserMailer.reject_candidate(@user, @job)
    assert_equal "Reject candidate", mail.subject
    assert_equal ["jjc@example.com"], mail.to
    assert_equal ['jjcaburrasi@gmail.com'], mail.from
    assert_match "Hello", mail.body.encoded
  end

  test "inform_candidate" do
    mail = UserMailer.inform_worker(@client, @user)
    assert_equal "Inform worker", mail.subject
    assert_equal ["jjc@example.com"], mail.to
    assert_equal ['jjcaburrasi@gmail.com'], mail.from
    assert_match "Hello", mail.body.encoded
  end

  test "inform_client_full_vacancies" do
    mail = UserMailer.client_full_vacancies(@app, @client)
    assert_equal "Client full vacancies", mail.subject
    assert_equal ["client@example.com"], mail.to
    assert_equal ['jjcaburrasi@gmail.com'], mail.from
    assert_match "A/A", mail.body.encoded
  end

end
