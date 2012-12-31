class ContactMailer < ActionMailer::Base
  default :from => "info@twoweeksllc.com"
  default :to => "info@twoweeksllc.com"

  def email_contact(contact)
    @contact = contact

    mail(:subject => "New Mail Received for Two Weeks from Everywhere Productions")
  end
end
