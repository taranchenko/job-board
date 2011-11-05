require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "email_reply" do
    reply = replies(:one)
    mail = Notifier.email_reply reply
    assert_equal "Re: #{reply.ad.title}", mail.subject
    assert_equal [reply.ad.user.email], mail.to
    assert_equal [reply.user.email], mail.from
    assert_match reply.body, mail.body.encoded
  end
end
