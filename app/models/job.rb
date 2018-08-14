class Job < ApplicationRecord
  belongs_to :driver
  belongs_to :car
  validate :busy_from_more_than_busy_to

  def busy_from_more_than_busy_to
    if busy_from > busy_to
      errors.add(:busy_to, "Busy to needs to be bigger than Busy from")
    end
  end
end
