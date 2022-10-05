Placement.delete_all
Candidacy.delete_all
JobRequest.delete_all
Worker.delete_all
Client.delete_all
Admin.delete_all
job_necessary_skills = ['Driving License', 'Tech', 'Construction', "Own motorcycle"]
job_desirable_skills= ["Work rotatory turn", "English",
    "Spanish", "Capacity to load heavy weights", "Disability certificate"]
all_skills= ["Work rotatory turn", "English",
    "Spanish", "Capacity to load heavy weights", "Disability certificate",'Driving License', 'Tech', 'Construction', "Own motorcycle" ]
categories= ['Logistics', 'Tech', 'Driving', 'Distribution', 'Sales', 'Other']

Worker.create!(name:"John Doe", 
                email: "w@w.com", password:"123456", skills: ["Driving License"])

client= Client.create!(name:"Amazon", 
    email: "c@c.com", address:"Baker St. 221b", password:"123456")

#Generate a pair of JobRequest to example client

4.times {
    category = categories.shuffle[1]
   
    rnd_number_skills = rand(1..5)
    rnd_necessary_number_skills = rand(1..2)
    rnd_skills = job_desirable_skills.shuffle[1..rnd_number_skills]
    rnd_necessary_skills= job_necessary_skills.shuffle[1..rnd_necessary_number_skills]
job = JobRequest.new(client: client, job_function:Faker::Job.title, 
    address: Faker::Address.city, monthly_salary: 1000, category: category, skills: rnd_skills, skills_necessary: rnd_necessary_skills,
    start_date: "20/08/2023", end_date: "31/08/2023", vacancies_count: rand(1..5))
    job.save(validate: false)
}

Admin.create!(email: "a@a.com", password:"123456")

# Generate a bunch of workers.

20.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    rnd_number_skills = rand(4..9)
    rnd_skills = all_skills.shuffle[1..rnd_number_skills]
    Worker.create!(name:  name,
    email: email,
    password:              password,
    skills: rnd_skills
    )
end

# Generate a bunch of clients.
10.times do |n|
    name  = Faker::Company.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    client = Client.create!(name:  name,
    email: email,
    password: password,
    )

    #Generate 5 job_request for each client.
    rnd_monthly_salary= rand(900..1500)

    5.times do
        category = categories.shuffle[1]
        rnd_number_skills = rand(1..5)
        rnd_necessary_number_skills = rand(1..2)
        rnd_skills = job_desirable_skills.shuffle[1..rnd_number_skills]
        rnd_necessary_skills= job_necessary_skills.shuffle[1..rnd_necessary_number_skills]
        job=JobRequest.new(client: client, job_function:Faker::Job.title, 
            address: Faker::Address.city, monthly_salary: rnd_monthly_salary, category: category, skills: rnd_skills, 
            skills_necessary: rnd_necessary_skills,
            start_date: "20/08/2023", end_date: "31/08/2023", vacancies_count: rand(1..5))
        job.save(validate:false)
    end
end

#Generate candidacies (2 each worker)
workers = Worker.all
jobs = JobRequest.all
rnd_job = rand(1..JobRequest.count)
workers.each do |worker|
jobs_selected= []
    4.times {
        rnd_job = rand(1..JobRequest.count)
        if !jobs_selected.include?(rnd_job)
            job = JobRequest.find(rnd_job)
            Candidacy.create!(worker: worker, job_request: job)
            jobs_selected << rnd_job
        end
    }
    
end

#Generate placements (4 finished and 4 current)
#4 finished
4.times do |n|


Placement.create!(client_id: 1, worker_id: n+1, 
                                candidacy_id: n+1, start_date: "20/08/2022", end_date: "31/08/2022", 
                                monthly_salary: 1000, created_at: nil, updated_at: nil, 
                                job_request_id:n+1)
end

#4 current 

4.times do |n|

Placement.create!(client_id: 1, worker_id: n+1, 
                                candidacy_id: n+1, start_date: "20/08/2022", end_date: "31/08/2023", 
                                monthly_salary: 1000, created_at: nil, updated_at: nil, 
                                job_request_id:n+1)


end







