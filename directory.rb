require 'CSV'
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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
      puts "Loaded the 'Input students' function"
      input_students
    when "2"
      puts "Loaded the 'Show students' function"
      show_students
    when "3"
      puts "Loaded the 'Save students' function"
      save_students
    when "4"
      puts "Loaded the 'Load students' function"
      puts "Which file would you like to load?"
      load_from = STDIN.gets.chomp
      load_students(load_from)
    when "9"
      puts "Exiting the program..."
      exit
    else
      puts "I don't know what you meant. Try again"
  end
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  @name = STDIN.gets.chomp.split.map(&:capitalize).join(' ')
  while !@name.empty? do
    puts "Which cohort are they part of?"
    @cohort = STDIN.gets.chomp.capitalize
    if @cohort.empty?
      @cohort = "November"
    end
    while !months.include?(@cohort.to_sym) do
      puts "Not a valid response. Try again (Hit enter to use the default value)"
      @cohort = STDIN.gets.chomp.capitalize
      if @cohort.empty?
        @cohort = "November"
      end
    end
    puts "What is their main hobby?"
    @hobby = STDIN.gets.chomp
    if @hobby.empty?
      @hobby = "Having fun"
    end
    push_students
    puts "Now we have #{@students.count} students."
    puts "Please provide another name, or hit return to finish"
    @name = STDIN.gets.chomp.split.map(&:capitalize).join(' ')
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r").readlines.each do |line|
    @name, @cohort, @hobby = line.chomp.split(',')
    push_students
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    puts "No file provided. Loading students.csv by default"
    load_students("students.csv")
    puts "Loaded #{@students.count} from students.csv"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def save_students
  puts "Where would you like to save the students list to?"
  save_to = STDIN.gets.chomp
  CSV.open(save_to, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort], student[:hobby]]
    end
  end
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

def push_students
  @students << {name: @name, cohort: @cohort.to_sym, hobby: @hobby}
end

try_load_students
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
