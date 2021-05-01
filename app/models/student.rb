# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    if query 
      name = Student.find_by(name: query)
      if name 
        Student.where("name LIKE ?", name)
      else 
        Student.all 
      end 
    else 
      Student.all 
    end 
  end

end
