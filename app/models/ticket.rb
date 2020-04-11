class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  after_save :update_stats
  before_destroy :destoy_ticket

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
end
