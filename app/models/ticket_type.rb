class TicketType < ApplicationRecord
  belongs_to :event
  validates :ticket_price, presence: { strict: true }, numericality: { only_integer: true, greater_than_or_equal_to:0 }
end
