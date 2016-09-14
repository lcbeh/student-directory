def interactive_menu
  students = []
  loop do
    # 1. print the menu ad ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets. chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end



def input_students

  puts "Please enter the information of the student:"
  puts "Name: "
  name = gets
  # another way to remove new line without using chomp
  name.gsub!("\n", "")

  students = []

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
      students << {name: name, cohort: cohort, country: country, skill: skill}
      if students.count == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
      puts "Please add new student information or return to finish"
      puts "Name: "
      name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  title = "The students of Unreal Academy"
  line = "-------------------------------------------------"
  puts title.center(50)
  puts line.center(50)
end

def print (students)
    p students
    idx = 0
    while idx < students.length
      puts "#{idx+1}. Name: #{students[idx][:name]}"
      puts "\s\s Cohort: #{students[idx][:cohort]}"
      puts "\s\s Country: #{students[idx][:country]}"
      puts "\s\s Best skill: #{students[idx][:skill]}"
      idx += 1
    end
end

def print_by_cohort (students)
  # optional step: creating a list of existing cohorts
  existing_cohorts = []
  students.map do |student|
    existing_cohorts << student[:cohort]
  end
  existing_cohorts.uniq!

  puts "The current cohorts are:"
  existing_cohorts.each {|i| puts i.id2name}
  puts "To view a list of students in a particular cohort, please specify the cohort: "
  cohort_choice = gets.chomp.to_sym

  # selecting students from a chosen cohort
    students.map do |student|
      if student[:cohort] == cohort_choice
        puts "#{student[:name]}"
      end
    end
end

def print (students)
  if students.count < 1
    puts "There is no student currently."
  else
    idx = 0
    while idx < students.count
      puts "#{idx+1}. Name: #{students[idx][:name]}"
      puts "\s\s Cohort: #{students[idx][:cohort]}"
      puts "\s\s Country: #{students[idx][:country]}"
      puts "\s\s Best skill: #{students[idx][:skill]}"
      idx += 1
    end
  end
end

def print_footer (students)
  if students.count == 0
    return
  elsif students.count == 1
    puts "Currently, we have 1 great student."
  else
    puts "Overall, we have #{students.count} great students."
  end
end

interactive_menu
