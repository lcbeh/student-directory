@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to database"
  # puts "4. Load students database"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  # function removed. Database is loaded automatically at start
  # when "4"
  # load_students
  when "9"
    puts "Goodbye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the information of the student:"
  puts "Name: "
  name = STDIN.gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty?
      puts "Cohort: "
      cohort = STDIN.gets.chomp.capitalize.to_sym
      cohort.empty? ? cohort = :November : cohort
      puts "Country of birth: "
      country = STDIN.gets.chomp
      country.empty? ? country = "UK" : country
      puts "Best skill: "
      skill = STDIN.gets.chomp
      skill.empty? ? skill = "Coding" : skill
      # store students only if information is new
      store_students(name, cohort, country, skill)
      if @students.count == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
      puts "Please add new student information or return to finish"
      puts "Name: "
      name = STDIN.gets.chomp
  end
end

def store_students(name, cohort, country, skill)
  @students << {name: name, cohort: cohort, country: country, skill: skill}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  title = "The students of Unreal Academy"
  line = "-------------------------------------------------"
  puts title.center(50)
  puts line.center(50)
end

def print_students_list
  if @students.count < 1
    puts "There is no student currently."
  else
    idx = 0
    while idx < @students.count
      puts "#{idx+1}. Name: #{@students[idx][:name]}"
      puts "\s\s Cohort: #{@students[idx][:cohort]}"
      puts "\s\s Country: #{@students[idx][:country]}"
      puts "\s\s Best skill: #{@students[idx][:skill]}"
      idx += 1
    end
  end
end

def print_footer
  if @students.count == 0
    puts " We don't have any student currently."
  elsif @students.count == 1
    puts "Currently, we have 1 great student."
  else
    puts "Overall, we have #{@students.count} great students."
  end
end

def save_students
  # find the correct database file to save data 
  # open file
  # convert hashes into array and into csv format
  # write file
  # close file
  filename = ARGV.first
  filename.nil? ? filename = "students.csv" : filename
  file = File.open(filename,"w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country], student[:skill]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
    file.close
    puts "Data saved."
end

# create a method which can load any file
def load_students (filename = "students.csv")   # students.csv as default argument
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, country, skill = line.chomp.split(",")
    store_students(name, cohort, country, skill)
  end
  file.close
  puts "Database loaded."
end

# create a method which can load file if argument is given in command line
def try_load_students
  # check if argument is given
  # if so, does the file exist? pass it as argument
  # if such file doesn't exist, let the user know.
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

try_load_students
interactive_menu
