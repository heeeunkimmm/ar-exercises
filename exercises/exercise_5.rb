require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...

@sum = Store.sum("annual_revenue")
@num = Store.count

puts "Total revenue for entire compnay is #{@sum}"
puts "Total revenue for entire compnay is #{@sum / @num}"

@oneMil= Store.where("annual_revenue > ?", 1000000).count

puts "#{@oneMil} is the number of stores that is generating $1M or more in annaul sales"