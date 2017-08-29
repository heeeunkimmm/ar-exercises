require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Store < ActiveRecord::Base
  has_many :employees
  validates_length_of :name, minimum: 3
  validates :annual_revenue,
            numericality: { only_integer: true, greater_than: 0 }
  validate :mens_apparel, :womens_apparel, :validate_apparel

  def validate_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, 'must be true or')
      errors.add(:womens_apparel, 'must be true')
    end
  end

end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_inclusion_of :hourly_rate, in: 40..200
  validates_presence_of :store_id
end

# Store.create(name: "error", annual_revenue: 0, mens_apparel: false, womens_apparel: false)

# pp Store.all

puts "Please enter a store name"

print ">"
@userInput = gets.chomp

e = Store.create(name: @userInput)

# e = Store.create(name: @userInput)

# puts "Store name errors:"
# e.errors.messages[:name].each {|err| puts err}
# puts '----'
# puts "annual_revenue errors:"
# e.errors.messages[:annual_revenue].each {|err| puts err}
# puts '----'
# puts "Mens_apparel errors:"
# e.errors.messages[:mens_apparel].each {|err| puts err}
# puts '----'
# puts "Womens_apparel errors:"
# e.errors.messages[:womens_apparel].each {|err| puts err}
# puts '----'

if e.errors.any?
  puts e.errors.full_messages
else
  puts 'all good'
end


# pp Employee.all
