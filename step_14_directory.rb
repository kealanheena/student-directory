# an empty array accessible to all methods
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  # 9 because we'll be adding more items
  puts "9. Exit"
end

def interactive_menu
  load_students(".gitignore/students.csv")
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
    puts "Students saved to file"
  when "4"
    puts "Please enter file you want to load"
    load_students(STDIN.gets.chomp)
    puts "Students loaded from file"
  when "9"
    puts "Exiting . . ."
    # this will cause the program to terminate
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter a cohort"
    cohort = STDIN.gets.chomp
    # add the student hash to the array
    push_students(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  File.open(".gitignore/students.csv", "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students(filename)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      push_students(name, cohort)
    end
  end
end

def try_load_students
  # first argument from the command line
  filename = ARGV.first
  # get out of the method if it isn't given
  return if filename.nil?
  # if it exists
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  # if it doesn't exist
  else
    puts "Sorry, #{filename} doesn't exist."
     # quit the program
    exit
  end
end

def push_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

# def print_working_directory
#   eval s=%q(puts"eval s=%q(#{s})")
#   # s="s=%c%s%c; printf s,34,s,34,10%c"; printf s,34,s,34,10
# end

try_load_students
interactive_menu

# loadfile = .gitignore/students.csv
