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
      @jobs = JobRequest.paginate(page: params[:page]).where.not(vacancies_count: 0).where("end_date > ?", Date.today)
    elsif client_signed_in?
      @jobs = JobRequest.paginate(page: params[:page]).where(client: current_client)
    else
      @jobs = JobRequest.paginate(page: params[:page]).where.not(vacancies_count: 0).where("end_date > ?", Date.today)
    end
    return @jobs
  end

end
