def input_students
  
  puts "Please enter the information of the student:"
  puts "Name: "
  name = gets.chomp
  
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
      puts "Now we have #{students.count} students"
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
  idx = 0
  while idx < students.length
    puts "#{idx+1}. Name: #{students[idx][:name]}" 
    puts "\s\s Cohort: #{students[idx][:cohort]}"
    puts "\s\s Country: #{students[idx][:country]}"  
    puts "\s\s Best skill: #{students[idx][:skill]}"
    idx += 1
  end
end

def print_footer (students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)