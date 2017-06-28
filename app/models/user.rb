class User < ApplicationRecord
  has_many :attend_rel, class_name: "UserEvent",
                              foreign_key: "attendee_id",
                              dependent: :destroy
  has_many :attending_events, through: :attend_rel
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"

  def attend(event)
    attending_events << event
  end

  def unattend(event)
    attending_events.delete(event)
  end

  def attend?(event)
    attending_events.include?(event)
  end

  def upcoming_events
    attending_events.where('date >= ?', Date.today)
  end

  def past_events
    attending_events.where('date < ?', Date.today)
  end

end
