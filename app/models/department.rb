class Department < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :sections, through: :courses, dependent: :destroy
  has_many :enrollments, through: :sections, dependent: :destroy
  has_many :students, through: :enrollments
  has_many :periods, through: :sections
end
