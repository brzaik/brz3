class ContactMailer < ActionMailer::Base
  default :from => "me@brzaik.com"
  default :to => "me@brzaik.com"

  def email_contact(contact)
    @contact = contact

    mail(:subject => "New Mail Received for Brzaik.com")
  end
end
