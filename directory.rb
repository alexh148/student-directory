# All students in a student array

def month(i)
  months = [
    :January,
    :February,
    :March,
    :April,
    :May,
    :June,
    :July,
    :August,
    :September,
    :October,
    :November,
    :December
  ]
  return months[i-1]
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  students = []
  name = gets.chomp.capitalize
  while !name.empty? do
    puts "Which cohort are they part of? Enter the number of the month"
    value = gets.chomp
    cohort = month(value.to_i)
    if value.empty?
      cohort = :November
    end
    puts "What is their main hobby?"
    hobby = gets.chomp
    if hobby.empty?
      hobby = "Having fun"
    end
    students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{students.count} students.\nPlease provide another name, or hit return to finish"
    name = gets.chomp.capitalize
  end
  students
end

def print_header
  puts "The students of Villians Academy".center(150)
  puts "-------------".center(150)
end

def print(students)
  # accum = 0
  # while accum < students.length do
  #   if students[accum][:name].length < 12
  #     puts "#{accum+1}. #{students[accum][:name]} (#{students[accum][:cohort]} cohort) - Hobby: #{students[accum][:hobby]}".center(150)
  #   end
  #     accum += 1
  # end
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) - Hobby: #{student[:hobby]}"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def print_students_with_first_letter(students)
  puts "Which letter would you like to use to filter students by name?"
  letter = gets.chomp.capitalize
  students.select.with_index do |student, index|
    if student[:name].chars.first == letter
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

students = input_students
puts students
print_header
print(students)
print_footer(students)
print_students_with_first_letter(students)
