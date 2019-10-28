# let's put all the students into an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november}, # ruby shorthand syntax 'name:' same as ':name =>'
{name: "Darth Vader",cohort: :november},
{name: "Nurse Ratcher", cohort: :november},
{name: "Micheal Corleone",cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West",cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffery Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens untill we call the methods
print_header
print(students)
print_footer(students)
