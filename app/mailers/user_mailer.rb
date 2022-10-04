class UserMailer < ApplicationMailer

  def application_submitted(user, app)
      @greeting = "Hello #{user.name}"
      @position = app.job_request.job_function
      mail to: user.email
  end

  def change_status(user, app)
      @greeting = "Hello #{user.name}"
      @position = app.job_request.job_function   
      mail to: user.email
  end

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

  def client_full_vacancies(candidacy, client)
      @greeting = "A/A Head of RRHH of #{client.name}"
      @company = client.name
      @job = candidacy.job_request
      @vacancies = @job.filled_vacancies
      @position = candidacy.job_request.job_function
      mail to: client.email
  end
end
