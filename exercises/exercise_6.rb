require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...

class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: "Hannah", last_name: "Kim", hourly_rate: 100)
@store1.employees.create(first_name: "Grace", last_name: "Lee", hourly_rate: 80)
@store1.employees.create(first_name: "Rachel", last_name: "Pie", hourly_rate: 50)
@store1.employees.create(first_name: "Jenna", last_name: "KC", hourly_rate: 20)
@store2.employees.create(first_name: "Corgi", last_name: "Love", hourly_rate: 100)
@store2.employees.create(first_name: "Husky", last_name: "DoubleLove", hourly_rate: 180)

# pp Employee.all