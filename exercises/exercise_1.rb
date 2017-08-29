require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :must_carry_clothes

  def must_carry_clothes
    if !(womens_apparel.present?) && !(mens_apparel.present?)
      errors.add(:apparel, "Store must carry men's and/or women's clothes.")
    end
  end

  before_destroy :before_destroy

  private

  def before_destroy
    return true if self.employees.count == 0
    errors.add :employees, "Cannot destroy store with employees!"
    false
    throw(:abort)
  end

end

Store.create(:name => 'Burnaby', :annual_revenue => 300000, :mens_apparel => true, :womens_apparel => true)
Store.create(:name => 'Richmond', :annual_revenue => 1260000, :womens_apparel => true)
Store.create(:name => 'Gastown', :annual_revenue => 190000, :mens_apparel => true)

puts Store.count