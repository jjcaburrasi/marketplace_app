class CandidaciesController < ApplicationController
    # before_action :authorized?, only: [:index]
    # JobRequest.all.each do |job|
    #     irb(main):007:1*   pp  job.skills.intersection(skills).size
    #     irb(main):008:0> end

    def new
        @candidacy = Candidacy.new
    end

    def create
        @job = JobRequest.find(params[:job_request_id])
        @candidacy = Candidacy.new
        @candidacy.worker = current_worker
        @candidacy.job_request = @job
        @candidacy.start_date = @job.start_date
        if !current_worker.working?
            a1= Set.new(current_worker.skills)
            a2= Set.new(@job.skills_necessary)
            compare_skills=a2.subset?(a1)
            if !compare_skills
                flash[:danger] = "You don't have the required skills"
                redirect_to job_request_path(@job)
            else
                if @candidacy.save
                    flash[:success] = "Application was successfully created."
                    UserMailer.application_submitted(current_worker, @candidacy).deliver_now
                    redirect_to job_requests_path
                else
                    flash[:danger] = "Could not be created"
                    redirect_to job_request_path(@job)
                end
            end
        else
            flash[:danger] = "You are already working, you can not apply to a job"
            redirect_to job_request_path(@job)
           
        end
    end

    def index
        if params[:job_request_id]
            @job = JobRequest.find(params[:job_request_id])
        end
        @candidacies = Candidacy.where(job_request_id: params[:job_request_id])
        @candidacies_0 = Candidacy.where(status: 'Application submitted').where(job_request_id: params[:job_request_id])
        @candidacies_1 = Candidacy.where(status: 'Interview').where(job_request_id: params[:job_request_id])
        @candidacies_2 = Candidacy.where(status: 'Hired').where(job_request_id: params[:job_request_id])
        @candidacies_3 = Candidacy.where(status: 'Rejected').where(job_request_id: params[:job_request_id])
    end

    def edit
        @candidacy = Candidacy.find(params[:id])
    end

    def update
        @candidacy = Candidacy.find(params[:id])
        @job = @candidacy.job_request
        if @candidacy.update(candidacy_params)
            flash[:info] = "Status updated"
            redirect_to job_request_candidacies_path(@job)
        end
        if @candidacy.status == 'Hired'
            @candidacy.worker.update(working:true)
            @job.update(vacancies_count: @job.vacancies_count-1, filled_vacancies: @job.filled_vacancies+1)
            Placement.create(job_request: @job, client: @job.client, client: @job.client, worker: @candidacy.worker, candidacy: @candidacy, start_date: @job.start_date, end_date: @job.end_date, monthly_salary: @job.monthly_salary)
            change_status(@candidacy.worker.candidacies.where.not(id: @candidacy.id))
        end
        if @candidacy.status == 'Rejected'
        UserMailer.reject_candidate(@candidacy.worker, @candidacy.job_request).deliver_now
        end

    end

    def change_status(candidacies)
        candidacies.each do |candidacy|
            candidacy.update(status: 'Inactive')
            candidacy.save
        end
    end

    def destroy
    end

    private
    def candidacy_params
      params.require(:candidacy).permit(:status, :start_date)
    end

    def authorized?
        return unless !current_admin
        redirect_to root_path, alert: 'Page not found'
    end
end
