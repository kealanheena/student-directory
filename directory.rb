# create a hash with empty arrays for each cohort
@students = {
January: [],
February: [],
March: [],
April: [],
May: [],
June: [],
July: [],
August: [],
September: [],
October: [],
November: [],
December: []
}

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.delete("\n")
  # while name is not empty, repeat this code
  while !name.empty? do
    cohort = input_cohort
    age = input_age
    add_to_cohort(name, age, cohort)
    #get another name from the user
    name = gets.delete("\n")
  end
end

def input_cohort
    puts "Please enter the students cohort"
    # takes user input and makes first letter a capital for compairing to cohorts values
    cohort = gets.delete("\n").capitalize
    # sets cohort to november if the user doesnt choose a cohort
    cohort = "November" if cohort.empty?
    cohort
end

def input_age
  puts "Please enter the students age"
  # adding more info works the same
  # gets user input for students age
  age = gets.delete("\n")
  # sets age to N/A if user doesn't set an age
  age = "N/A" if age.empty?
  age
end

def add_to_cohort(name, age, cohort)
  @students.each { |key, value|
    if cohort.include?(key.to_s[0..2])
      # add the student hash to the array
      value << {name: name, age: age}
    end
  }
  head_count = @students.map {|key, value| value.count}.reduce(0, :+)
  head_count == 1 ? (puts "We now have #{head_count} student") : (puts "We now have #{head_count} students")
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_students_list
  if @students.map {|key, value| value.count}.reduce(0, :+) == 0
    puts "There are currently no students in any cohort"
  else
    puts "Which cohort would you like to see?"
    selected_cohort = gets.delete("\n").capitalize
    @students.each do |key, value|
      if selected_cohort.include?(key.to_s[0..2])
        puts "#{key} cohorts students:"
        value.each_with_index do |student, index|
          puts "#{index + 1}. #{student[:name]} age: #{student[:age]}"
        end
      end
    end
  end
end

def print_footer
  head_count = @students.map {|key, value| value.count}.reduce(0, :+)
  if head_count == 0
    puts "Would you like to join one?"
  elsif head_count == 1
    (puts "Overall, we have #{head_count} great student")
  else
    (puts "Overall, we have #{head_count} great students")
  end
end

def print_menu
  # print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  # show the students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  # do what the user has asked
  case selection
    when "1"
      # input the students
      input_students
    when "2"
      show_students
    when "9"
      # this will cause the program to terminate
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

interactive_menu
