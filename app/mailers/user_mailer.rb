class UserMailer < ActionMailer::Base
  default :from => "emap@csg.org"

  def forgot_password(user, key)
    @user, @key = user, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => user.email_address )
  end

end
