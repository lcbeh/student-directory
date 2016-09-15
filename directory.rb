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
  puts "4. Load students database"
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
  when "4"
    load_students
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

require "csv"

def save_students
  puts "Which database file would you like to save the information to? Return for default students database (students.csv)"
  filename = choose_file
  CSV.open(filename, "wb") do |row|
    @students.each do |student|
      row << [student[:name], student[:cohort], student[:country], student[:skill]]
    end 
  end
  puts "Data saved."
end


def load_students
  puts "Which database file would you like to load? Return for default students database (students.csv)"
  filename = choose_file
  CSV.foreach(filename) do |line|
    name, cohort, country, skill = line
    store_students(name, cohort, country, skill)
  end
  puts "#{filename} loaded."
end

def choose_file
  filename = STDIN.gets.chomp
  filename.empty? ? filename = "students.csv" : filename = filename
  if File.exists?(filename) == false 
    puts "Sorry, #{filename} doesn't exist."
    interactive_menu
  end
  filename
end

# omit try_load_students for exercise 14.5

interactive_menu
