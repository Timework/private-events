class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attends, foreign_key: "attended_event_id"
    has_many :attendees, through: :attends, source: :attendee
    scope :future, -> { where("date >= ?", Date.today) }
    scope :past, -> { where("date < ?", Date.today) }

end
