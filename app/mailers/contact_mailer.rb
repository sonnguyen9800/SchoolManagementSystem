class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_info.subject
  #
  def contact_info(contact)
    @contact = contact
    mail to: "nguyenhs9800@gmail.com", subject: contact.name + " sent a contact request"
  end
end
