require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "application_submitted" do
    mail = UserMailer.application_submitted
    assert_equal "Application submitted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "change_status" do
    mail = UserMailer.change_status
    assert_equal "Change status", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reject_candidate" do
    mail = UserMailer.reject_candidate
    assert_equal "Reject candidate", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
