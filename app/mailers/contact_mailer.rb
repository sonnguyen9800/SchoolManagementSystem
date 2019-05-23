class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_info.subject
  #
  def send_feedback(feedback, email_address)
    @feedback = feedback
    @email = email_address
    mail to: @email, subject: feedback.subject
  end

end
