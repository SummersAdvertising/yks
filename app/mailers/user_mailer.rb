class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm.subject
  #
  def confirm(ticket)
    @greeting = "Hi"
    @id = ticket.id
    mail(:to => ticket.email, :subject => "Send Test")
  end
end
