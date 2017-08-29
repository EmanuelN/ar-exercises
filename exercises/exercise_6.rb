require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 12)
@store2.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 13)
@store1.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 17)
@store2.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 22)