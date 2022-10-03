# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/application_submitted
  def application_submitted
    UserMailer.application_submitted
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/change_status
  def change_status
    UserMailer.change_status
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reject_candidate
  def reject_candidate
    UserMailer.reject_candidate
  end

end
