Candidacy.delete_all
JobRequest.delete_all
Placement.delete_all
Worker.delete_all
Client.delete_all
Admin.delete_all


Worker.create!(name:"worker", 
                email: "w@w.com", password:"123456", skills: ["Driving License"])

Client.create!(name:"client", 
    email: "c@c.com", address:"Address", password:"123456")

Admin.create!(email: "a@a.com", password:"123456")

# Generate a bunch of workers.
skills = ['Driving License', 'Tech', 'Construction', "Own motorcycle", "Work rotatory turn", "English",
    "Spanish", "Capacity to load heavy weights", "Disability certificate"]
20.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    rnd_number_skills = rand(1..5)
    rnd_skills = skills.shuffle[1..rnd_number_skills]
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

    #Generate 2 job_request for each client.
    rnd_monthly_salary= rand(900..1500)

    5.times do
        rnd_number_skills = rand(1..5)
        rnd_skills = skills.shuffle[1..rnd_number_skills]
        JobRequest.create!(client: client, job_function:Faker::Job.title, address: Faker::Address.city, monthly_salary: rnd_monthly_salary, skills: rnd_skills, start_date: "20/08/2023", end_date: "31/08/2023", vacancies_count: rand(1..5))
    end
end

#Generate candidacies (2 each worker)
workers = Worker.all
jobs = JobRequest.all
rnd_job = rand(1..JobRequest.count)

# workers.each do |worker|
#     2.times {
#         rnd_job = rand(1..JobRequest.count)
#         job = JobRequest.find(rnd_job)
#         Candidacy.create!(worker: worker, job_request: job)

#     }
    
# end






