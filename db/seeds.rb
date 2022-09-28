Worker.create!(name:"worker", 
                email: "w@w.com", password:"123456", skills: ["Driving"])

Client.create!(name:"client", 
    email: "c@c.com", address:"Address", password:"123456")

Admin.create!(email: "a@a.com", password:"123456")

# Generate a bunch of workers.
200.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    skills = ["Driving", "Tech", "Hard"]
    Worker.create!(name:  name,
    email: email,
    password:              password,
    skills: skills
    )
end

# Generate a bunch of clients.
40.times do |n|
    name  = Faker::Company.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    Client.create!(name:  name,
    email: email,
    password:              password,
    )

    #Generate 2 job_request for each client.
    rnd_monthly_salary= rand(900..1500)

    2.times do |fakejob|
        JobRequest.create!(client_id: n, job_function:Faker::Job.title,monthly_salary: rnd_monthly_salary, start_date: "20/08/2023", end_date: "31/08/2023", vacancies_count: "1")
    end


end



