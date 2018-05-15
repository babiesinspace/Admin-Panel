# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'

# #First Seed

# #Create Admin
# admin = User.create(email: "admin@gmail.com", password: "adminpassword", first: "Principal", last: "School", age: 43, education: "PhD", type: "Admin", salary: Salary.create(income: 100000))

# #Create Teachers
# 10.times do 
#   User.create(email: Faker::Internet.unique.email, password: "teacherpassword", first: Faker::Name.first_name, last: Faker::Name.last_name, age: Faker::Number.between(18, 100), education: ["BA", "MA", "PhD", "Self"].sample, type: "Teacher", salary: Salary.create(income: 75000))
# end 

#Second Seed
# Create Courses
admin = Admin.first 
sei = admin.courses.create(name: "Software Development Intensive", hours: 450, level: "Beginner")
sep = admin.courses.create(name: "Software Development Part Time", hours: 450, level: "Beginner")
ux = admin.courses.create(name: "UX Development", hours: 250, level: "Beginner")
adv_rails = admin.courses.create(name: "Advanced Rails", hours: 300, level: "Advanced")
db_mg = admin.courses.create(name: "Database Management", hours: 350, level: "Intermediate")
js_f = admin.courses.create(name: "JavaScript Frameworks", hours: 400, level: "Intermediate")

#Create Cohorts
sei.cohorts.create(name: "WDF", startdate: DateTime.new(2018,2,26), enddate: DateTime.new(2018,6,9), teacher_id: Teacher.all.sample.id)
sei.cohorts.create(name: "Spring", startdate: DateTime.new(2018,2,26), enddate: DateTime.new(2018,6,9), teacher_id: Teacher.all.sample.id)
sei.cohorts.create(name: "Fall", startdate: DateTime.new(2018,8,26), enddate: DateTime.new(2018,12,9), teacher_id: Teacher.all.sample.id)

sep.cohorts.create(name: "Fall", startdate: DateTime.new(2018,9,4), enddate: DateTime.new(2018,4,9), teacher_id: Teacher.all.sample.id)
sep.cohorts.create(name: "Spring", startdate: DateTime.new(2018,2,16), enddate: DateTime.new(2018,8,9), teacher_id: Teacher.all.sample.id)

ux.cohorts.create(name: "Summer", startdate: DateTime.new(2018,6,23), enddate: DateTime.new(2018,9,2), teacher_id: Teacher.all.sample.id)
ux.cohorts.create(name: "Winter", startdate: DateTime.new(2018,11,13), enddate: DateTime.new(2018,3,13), teacher_id: Teacher.all.sample.id)

adv_rails.cohorts.create(name: "2018", startdate: DateTime.new(2018,5,3), enddate: DateTime.new(2018,8,14), teacher_id: Teacher.all.sample.id)

db_mg.cohorts.create(name: "2017", startdate: DateTime.new(2017,12,6), enddate: DateTime.new(2018,3,9), teacher_id: Teacher.all.sample.id)

js_f.cohorts.create(name: "2017", startdate: DateTime.new(2018,11,29), enddate: DateTime.new(2018,2,12), teacher_id: Teacher.all.sample.id)

# #Third Seed
# #Create Students
# 100.times do 
#   User.create(email: Faker::Internet.unique.email, password: "studentpassword", first: Faker::Name.first_name, last: Faker::Name.last_name, age: Faker::Number.between(18, 100), education: ["BA", "MA", "PhD", "Self"].sample, type: "Student")
# end

# #Fourth Seed
# Student.all.each do |student|
#   student.cohorts << Cohort.find(rand(1..10))
# end 

# # !!!check if you can add student to grade on line 66!!
# 40.times do 
#   StudentCohort.all.sample.update_attributes(grade: rand(50..100))
# end 