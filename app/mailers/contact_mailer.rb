class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_info.subject
  #
  def send_feedback(feedback)
    @feedback = feedback
    mail to: "nguyenhs9800@gmail.com", subject: feedback.subject
    mail to: "quocanhdk51@gmail.com", subject: feedback.subject
  end
end
