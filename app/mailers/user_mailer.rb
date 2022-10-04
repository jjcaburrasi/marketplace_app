class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.application_submitted.subject
  #
  def application_submitted(user, app)
      @greeting = "Hello #{user.name}"
      @position = app.job_request.job_function
      mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.change_status.subject
  #
  def change_status(user, app)
      @greeting = "Hello #{user.name}"
      @position = app.job_request.job_function   
     
  
      mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reject_candidate.subject
  #
  def reject_candidate(user, job)
      @greeting = "Hello #{user.name}"
      @position = job.job_function
      mail to: user.email
  end

  def inform_worker(client, worker)
      @greeting = "Hello #{worker.name}"
      @company = client.name
      mail to: worker.email

  end
end
