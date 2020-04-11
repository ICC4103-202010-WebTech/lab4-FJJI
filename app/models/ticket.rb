class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  after_save :update_stats
  before_destroy :destoy_ticket
  before_create :check_space

  private
    def update_stats
      es = self.ticket_type.event.event_stat
      es.tickets_sold += 1
      es.attendance += 1
    end
  private
  def destoy_ticket
    es = self.ticket_type.event.event_stat
    es.tickets_sold -= 1
    es.attendance -= 1
  end
  private
  def check_space

    ev = self.ticket_type.event.event_venue
    es = self.ticket_type.event.event_stat
    errors.add(:ev, :ev.capacity,:es.tickets_sold, message: "Event Overflow") if if ev.capacity <= es.tickets_sold

    end
  end
end
