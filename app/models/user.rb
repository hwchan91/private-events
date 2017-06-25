class User < ApplicationRecord
  has_many :attending_events, class_name: "UserEvent",
                              foreign_key: "attendee_id",
                              dependent: :destroy
  has_many :attend, through: :attending_events, source: :attending_event
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
end
