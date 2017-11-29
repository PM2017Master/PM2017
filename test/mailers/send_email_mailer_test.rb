require 'test_helper'

class SendEmailMailerTest < ActionMailer::TestCase
  test "lecture_date" do
    mail = SendEmailMailer.lecture_date
    assert_equal "Lecture date", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
