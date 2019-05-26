require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  setup do
    @feedback = feedbacks(:one)
    @email_address = "to@example.org"
  end
  
  test "contact_info" do
    mail = ContactMailer.send_feedback(@feedback, @email_address)
    assert_equal ["to@example.org"], mail.to
    assert_equal ["rad.sender001@gmail.com"], mail.from
  end

end
