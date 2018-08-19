class Job < ApplicationRecord
  belongs_to :driver
  belongs_to :car
  validate :busy_from_greater_than_busy_to
  validate :car_taken
  validate :driver_taken
  validates :busy_to, :busy_from, :driver, :car, presence: true

  def busy_from_greater_than_busy_to
    if busy_from >= busy_to
      errors.add(:busy_to, " needs to be greater than Busy from")
    end
  end

  def car_taken
    if car.jobs.where('busy_from <= ? AND busy_to >= ?', busy_to, busy_from).count > 0
      errors.add(:car, " is taken during selected period")
    end
  end

  def driver_taken
    if driver.jobs.where('busy_from <= ? AND busy_to >= ?', busy_to, busy_from).count > 0
      errors.add(:driver, " is busy during selected period")
    end
  end
end
