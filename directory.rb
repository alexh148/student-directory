# All students in a student array

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  students = []
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  name = gets.chomp.split.map(&:capitalize).join(' ')
  while !name.empty? do
    puts "Which cohort are they part of?"
    cohort = gets.chomp.capitalize.to_sym
    if cohort.empty?
      cohort = :November
    end
    while !months.include?(cohort) do
      puts "Not a valid response. Try again (Hit enter to use the default value)"
      cohort = gets.chomp.capitalize.to_sym
      if cohort.empty?
        cohort = :November
      end
    end
    puts "What is their main hobby?"
    hobby = gets.chomp
    if hobby.empty?
      hobby = "Having fun"
    end
    students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{students.count} students.\nPlease provide another name, or hit return to finish"
    name = gets.chomp.split.map(&:capitalize).join(' ')
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
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) - Hobby: #{student[:hobby]}".center(150)
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
