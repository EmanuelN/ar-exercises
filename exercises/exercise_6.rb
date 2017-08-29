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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :hourly_rate, :in => 40..200
  validates_presence_of :store

  before_save :random_password

  private

  def random_password
    self.password = (0...8).map { (33 + rand(60)).chr }.join
  end

end

@store1.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 60)
@store2.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 200)
@store1.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 100)
@store2.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, hourly_rate: 95)