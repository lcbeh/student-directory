def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat his code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header  
  puts "The students of Villian Academy"
  puts "-------------"
end

def print (students)
  puts "To view students whose name begins with a specific letter, please enter a letter: "
  letter = gets.chomp
  selected_students = 0
  students.each_with_index do |student|
        if student[:name][0] == letter
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
        selected_students += 1
        end
     end
  puts "We have #{selected_students} students whose name begins with #{letter}" 
end

def print_footer (students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

