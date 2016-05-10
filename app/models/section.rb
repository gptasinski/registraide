class Section < ActiveRecord::Base
  belongs_to :course
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  belongs_to :period


  def status
    self.closed == true ? "CLOSED" : "OPEN"
  end

  def full?
    self.seats == 0
  end

  def set_closed
    self.full? ? self.closed = true : self.closed = false
    self.save
  end

  def reset_seats
    self.seats += 1
    self.save
  end

  def reset_section
    self.reset_seats
    self.set_closed
  end

  def check_section_seats
    if self.seats > 0
      self.seats -= 1
      self.set_closed
      self.save
    end
  end

  def set_category(params)
    self.category = params
  end




end

