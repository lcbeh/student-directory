def input_students
  puts "Please enter the information of the student:"
  puts "Name: "
  name = gets.chomp
  puts "Cohort: "
  cohort = gets.chomp
  puts "Country of birth"
  country = gets.chomp
  puts "Hobbies"
  hobbies = gets.chomp
  

 
  students = []
  
  # while the name is not empty, repeat his code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, country: country, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    puts "Please add new student information or return to finish"
    puts "Name: "
    name = gets.chomp
    if !name.empty?
      puts "Cohort: "
      cohort = gets.chomp
      puts "Country of birth"
      country = gets.chomp
      puts "Hobbies"
      hobbies = gets.chomp
    end
  end
  # return the array of students
  students
end

def print_header  
  puts "The students of Unreal Academy"
  puts "-------------"
end

def print (students)
  idx = 0
  while idx < students.length
    puts "#{idx+1}. Name: #{students[idx][:name]}" 
    puts "\s\s Cohort: #{students[idx][:cohort]}"
    puts "\s\s Country:#{students[idx][:country]}"  
    puts "\s\s Hobbies: #{students[idx][:hobbies]}"
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