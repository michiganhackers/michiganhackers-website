class UserMailer < ActionMailer::Base
  
  default from: "no-reply@michiganhackers.org"
  
  def new_student_user(user)
    @user = user
    @upcoming_events = Event.upcoming_events
    mail(to: user.email, subject: "Welcome to Michigan Hackers")
  end
  
end