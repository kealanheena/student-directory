def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    # dont know how to check for typo come back to it later
    puts "Please enter the students cohort"
    cohort = gets.chomp
    cohort.empty? ? (cohort = "november") : (cohort.to_sym)
    puts "Please enter the students age"
    # adding more info works the same
    age = gets.chomp
    age = "N/A" if age.empty?
    # add the student hash to the array
    students << {name: name, age: age, cohort: cohort}
    puts "We now have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
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
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]} age: #{students[i][:age]} (#{students[i][:cohort]} cohort)".center(40, "-")
    i += 1
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens untill we call the methods
students = input_students
print_header
print(students)
print_footer(students)
