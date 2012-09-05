class UserMailer < ActionMailer::Base
  
  default from: "no-reply@michiganhackers.org"
  
  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Michigan Hackers")
  end
  
end