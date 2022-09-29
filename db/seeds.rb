JobRequest.delete_all
Worker.delete_all
Client.delete_all
Admin.delete_all

Worker.create!(name:"worker", 
                email: "w@w.com", password:"123456", skills: ["Driving"])

Client.create!(name:"client", 
    email: "c@c.com", address:"Address", password:"123456")

Admin.create!(email: "a@a.com", password:"123456")

# Generate a bunch of workers.
20.times do |n|
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

    2.times do
        JobRequest.create!(client: client, job_function:Faker::Job.title,monthly_salary: rnd_monthly_salary, start_date: "20/08/2023", end_date: "31/08/2023", vacancies_count: rand(1..5))
    end


end



