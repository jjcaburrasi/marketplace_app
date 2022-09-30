module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "MKPlace"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def someone_signed_in?
    worker_signed_in? || admin_signed_in? || client_signed_in?
  end

  def which_jobs
    if worker_signed_in? || admin_signed_in?
      @jobs = JobRequest.where.not(vacancies_count: 0)
    elsif client_signed_in?
      @jobs = JobRequest.where(client: current_client)
    else
      @jobs = JobRequest.where.not(vacancies_count: 0)
    end
    return @jobs
  end



end
