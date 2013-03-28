require_relative '../../db/config'

# implement your Student model here
class Student < ActiveRecord::Base
  validates :email, :uniqueness => true, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/ }
  validates_numericality_of :age, :greater_than_or_equal_to => 5
  validates :phone, :format => { :with => /^[\\(]{0,1}([0-9]){3}[\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$/ }

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
end

