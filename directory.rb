def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create a hash with empty arrays for each cohort
  @cohorts = {
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
  @cohorts
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
  @cohorts.each { |key, value|
    if cohort.include?(key.to_s[0..2])
      # add the student hash to the array
      value << {name: name, age: age}
    end
  }
  head_count = @cohorts.map {|key, value| value.count}.reduce(0, :+)
  head_count == 1 ? (puts "We now have #{head_count} student") : (puts "We now have #{head_count} students")
  @cohorts
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  # students.each_with_index do |student, index|
  #   if student[:name][0].downcase == "k" && student[:name].length < 12
  #     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  #   end
  # end
  # i = 0
  # while i < students.length
  #   puts "#{i + 1}. #{students[i][:name]} age: #{students[i][:age]} (#{students[i][:cohort]} cohort)".center(40, "-")
  #   i += 1
  # end
  puts "Which cohort would you like to see?"
  selected_cohort = gets.delete("\n").capitalize
  students.each do |key, value|
    if selected_cohort.include?(key.to_s[0..2])
      puts "#{key} cohorts students:"
      value.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} age: #{student[:age]}"
      end
    end
  end
end

def print_footer(students)
  head_count = students.map {|key, value| value.count}.reduce(0, :+)
  head_count == 1 ? (puts "Overall, we have #{head_count} great student") : (puts "Overall, we have #{head_count} great students")
end

students = input_students
print_header
print(students)
print_footer(students)
