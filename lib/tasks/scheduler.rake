desc "Check if end date of placements is today"
task :check_jobs => :environment do

  puts "starting method_name process"

  Placement.each do |placement|
    if placement.end_date == Date.today
        placement.worker.working = false
        placement.worker.available = true
    end
  end


  puts "ending method_name process"

end