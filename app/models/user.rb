class User < ActiveRecord::Base

  has_many :enrollments, foreign_key: :student_id, dependent: :destroy
  has_many :sections, through: :enrollments
  has_many :courses, through: :sections
  has_many :periods, through: :sections #is this necessary? why would it need to be found?
  has_many :student_requirements, foreign_key: :student_id, dependent: :destroy
  has_many :requirements, through: :student_requirements


  has_secure_password
  validates :first_name, { presence: true }
  validates :last_name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates_format_of :email,:with => /\A[^@\s]+@cps.edu+\z/, message: "You need a CPS email to use this site.", on: :create
  validates :id_number, {presence: true, uniqueness: true}
  validates :password, presence: true, on: :create

end
