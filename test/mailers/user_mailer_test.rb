require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "candidacy_received" do
    mail = UserMailer.candidacy_received
    assert_equal "Candidacy received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
