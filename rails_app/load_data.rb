require File.dirname(__FILE__) + '/config/environment'

def execute(folder)
  sequence_id = folder.gsub("data/","")
  s = Sequence.new
  s.task_id = sequence_id
  val = sequence_id.split("_")
  s.patient_id = val[0].to_i
  s.state = val[1].to_i
  s.task_index = val[2].to_i
  s.repetition_index = val[3].to_i

  #need to change accordingly
  date_to = Time.new(2013, 04, 14)
  date_from = Time::now
  s.recorded_at = Time.at(date_from + rand * (date_to.to_f - date_from.to_f))#Time::now
  num_rounds = 0;
  trajectory_hash = Hash.new
  density_hash = Hash.new

  Dir.glob("#{folder}/*.txt") do |f|
  	num_rounds = num_rounds + 1
    f_name = f.gsub("#{folder}/","").gsub(".txt","")
    f_name_arr = f_name.split("_")
    f_type = f_name_arr[4]
    r_index = f_name_arr[5].to_i
    case f_type
      when "tra"
        arr = IO.readlines(f)
        x_value = []
        y_value = []
        num_xy = arr[0].split(" ")[0].to_i
        for i in 1..num_xy
          line = arr[i].split(" ")
          x_value << line[0]
          y_value << line[1]
        end
        h = Hash.new
        h["x"] = x_value.join(" ")
        h["y"] = y_value.join(" ")
        trajectory_hash[r_index] = h
      when "den"
        arr = IO.readlines(f)
        line = arr[0].strip
        density_hash[r_index] = line
      when "skel"
        puts "ske"
    end
    #puts f_name #if File.file?(f)
	# do whatever you want with f, which is a filename within the
	# given directory (not fully-qualified)
   end
   s.density = density_hash
   s.trajectory = trajectory_hash
   num_rounds = num_rounds/3
   s.num_rounds = num_rounds
   puts s.task_id
   puts s.task_index
   puts s.patient_id
   puts s.state
   puts s.repetition_index
   puts s.num_rounds
   s.save
end
if __FILE__ == $0
  if ARGV.length == 1
    # Display starting time.
    time = Time::now
    puts "--Starting Time: #{time.strftime('%Y-%m-%d %H:%M:%S')}--"
    execute(ARGV[0])
    puts "-- (#{Time::now - time} sec) --"
  else
    puts "ruby update_stirista_companies.rb <stirista_company_file>"
  end
end