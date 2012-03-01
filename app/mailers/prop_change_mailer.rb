class PropChangeMailer < ActionMailer::Base
  default :from => "emap@csg.org"
  
  def standard_comment(id, name, date, phone, organization, email, address, city, state, zip, standard, standard_area, com_rec, comment, support, rop_email)
    @id, @name, @date, @phone, @organization, @email, @address, @city, @state, @zip, @standard, @standard_area, @com_rec, @comment, @support, @rop_email = id, name, date, phone, organization, email, address, city, state, zip, standard, standard_area, com_rec, comment, support, rop_email
    mail( :subject => "Comment for the Emergency Management Standard by EMAP - 2013",
          :to      => email,
          :bcc      => "jaraddowning@gmail.com" )
  end

end
