class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id"
    has_many :attends, foreign_key: "attendee_id"
    has_many :attended_events, through: :attends, source: :attended_event

    def upcoming_events
        event = []
        self.events.each do |x|
            if !x.date.past?
                event.push(x)
            end
        end
        return event
    end

    def previous_events
        event = []
        self.events.each do |x|
            if x.date.past?
                event.push(x)
            end
        end
        return event
    end
end
