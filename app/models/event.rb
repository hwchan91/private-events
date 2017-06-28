class Event < ApplicationRecord
  has_many :event_attendants, class_name: "UserEvent",
                              foreign_key: "attending_event_id",
                              dependent: :destroy
  has_many :attendees, through: :event_attendants
  belongs_to :creator, class_name: "User"
  scope :upcoming, -> {where("events.date >= ?", Date.today) }
  scope :past, -> {where("events.date < ?", Date.today) }


end
