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
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  if @students.empty?
    puts "The directory is empty."
  else
    print_header
    print_students_list
    print_footer
  end
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
      puts "I don't know what you meant. Try again"
  end
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
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
    @students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{@students.count} students."
    puts "Please provide another name, or hit return to finish"
    name = gets.chomp.split.map(&:capitalize).join(' ')
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def print_header
  puts "The students of Villians Academy".center(150)
  puts "-------------".center(150)
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) - Hobby: #{student[:hobby]}".center(150)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(150)
end

interactive_menu

=begin # Unused code from example exercises
def print_students_with_first_letter(students)
  puts "Which letter would you like to use to filter students by name?"
  letter = gets.chomp.capitalize
  students.select.with_index do |student, index|
    if student[:name].chars.first == letter
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_by_cohort(students)
  if !students.is_a? Array
    return empty_list_error
  else
    groups = {}
    students.each do |student|
      cohort = student[:cohort]
      if groups[cohort] == nil
        groups[cohort] = []
      end
      groups[cohort].push(student[:name])
    end
    groups.each do |key, value|
      puts "#{key}:"
      value.each do |name|
        puts name
      end
      puts "-----"
    end
  end
end
=end
