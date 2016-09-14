@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to database"
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
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the information of the student:"
  puts "Name: "
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty?
      puts "Cohort: "
      cohort = gets.chomp.capitalize.to_sym
      cohort.empty? ? cohort = :November : cohort
      puts "Country of birth: "
      country = gets.chomp
      country.empty? ? country = "UK" : country
      puts "Best skill: "
      skill = gets.chomp
      skill.empty? ? skill = "Coding" : skill
    # add the student hash to the array
      @students << {name: name, cohort: cohort, country: country, skill: skill}
      if @students.count == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
      puts "Please add new student information or return to menu"
      puts "Name: "
      name = gets.chomp
  end
end

def save_students
  # open file
  # convert hashes into array and into csv format
  # write file
  # close file
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country], student[:skill]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
    file.close
    puts "Data saved."
end

def print_header
  title = "The students of Unreal Academy"
  line = "-------------------------------------------------"
  puts title.center(50)
  puts line.center(50)
end

def print_students_list
    idx = 0
    while idx < @students.length
      puts "#{idx+1}. Name: #{@students[idx][:name]}"
      puts "\s\s Cohort: #{@students[idx][:cohort]}"
      puts "\s\s Country: #{@students[idx][:country]}"
      puts "\s\s Best skill: #{@students[idx][:skill]}"
      puts
      idx += 1
    end
end

def print_by_cohort
  # optional step: creating a list of existing cohorts
  existing_cohorts = []
  @students.map do |student|
    existing_cohorts << student[:cohort]
  end
  existing_cohorts.uniq!

  puts "The current cohorts are:"
  existing_cohorts.each {|i| puts i.id2name}
  puts "To view a list of students in a particular cohort, please specify the cohort: "
  cohort_choice = gets.chomp.to_sym

  # selecting students from a chosen cohort
  @students.map do |student|
    if @student[:cohort] == cohort_choice
        puts "#{@student[:name]}"
    end
  end
end

def print
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

interactive_menu
