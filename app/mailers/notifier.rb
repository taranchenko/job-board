class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_reply.subject
  #
  def email_reply(reply)
    @text = reply.body
    mail to: reply.ad.user.email, from: reply.user.email, subject: "Re: #{reply.ad.title}"
  end
end
