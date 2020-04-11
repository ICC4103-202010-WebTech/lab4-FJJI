class EventVenue < ApplicationRecord
  has_many :events
  validates :name, presence: { strict: true }
  validates :address, presence: { strict: true }
  validates :capacity, presence: { strict: true }, numericality: { only_integer: true, greater_than_or_equal_to:10 }
end

#The name and address of an EventVenue must not be blank. In addition, capacity
# must be integer, with 10 as the minimum value.
