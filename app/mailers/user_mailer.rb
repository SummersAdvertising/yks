# encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm.subject
  #
  def confirm(ticket)
    @greeting = "Hi"
    @ticket = ticket
    @id = ticket.id
    
    admins = User.where( :define_id => 6 );
    
    admins.each do | admin |
    	mail(:to => admin.email, :subject => "客服留言通知信 - 誼光家事網站")
    end
    
  end
end
