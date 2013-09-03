require File.dirname(__FILE__) + '/config/environment'

def execute(folder)
  Dir.glob("#{folder}/0*") do |f|
  	puts f
  	process(f)
  end
end


def process(folder)
  sequence_id = folder.gsub("data/","")
  s = Sequence.only(:task_id, :step).find_by(task_id:sequence_id)

  val = sequence_id.split("_")

  step_hash = Hash.new

  Dir.glob("#{folder}/*.txt") do |f|
    f_name = f.gsub("#{folder}/","").gsub(".txt","")
    f_name_arr = f_name.split("_")
    f_type = f_name_arr[4]
    r_index = f_name_arr[5].to_i
    case f_type
      when "ste"
        arr = IO.readlines(f)
        line = arr[0].strip
        step_hash[r_index] = line
      when "skel"
        puts "ske"
    end
    #puts f_name #if File.file?(f)
  # do whatever you want with f, which is a filename within the
  # given directory (not fully-qualified)
   end
   s.step = step_hash
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