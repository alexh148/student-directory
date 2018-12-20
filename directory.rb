# All students in a student array

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print(students)
  accum = 0
  while accum < students.length do
    puts "#{accum+1}. #{students[accum][:name]} (#{students[accum][:cohort]} cohort)"
    accum += 1
  end
  # students.each_with_index do |student, index|
  #   if student[:name].length < 12
  #     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  #   end
  # end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def print_students_with_first_letter(students)
  puts "Which letter would you like to use to filter students by name?"
  letter = gets.chomp
  students.select.with_index do |student, index|
    if student[:name].chars.first == letter
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

students = input_students
print_header
puts students[0][:name]
print(students)
print_footer(students)
print_students_with_first_letter(students)
