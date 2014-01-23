class UtilitySharingMailer < ActionMailer::Base
  default from: "utlities@kenneywww.com"

  def shared_utility_email(utility_sharing, sharer)
    @user = utility_sharing.user
    @utility =  utility_sharing.utility
    @sharer = sharer

    mail to: @user.email, subject: "#{ sharer.email } shared a utility with you"
  end
  
end
