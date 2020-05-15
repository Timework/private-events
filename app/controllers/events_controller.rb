class EventsController < ApplicationController
    before_action :authenticate_user!, :only => [:new]
    def index
        @events = Event.all
        @prev_events = Event.past
        @upcoming_events = Event.future
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
        @attendees = @event.attendees.all
    end

    private
    def event_params
        params.require(:event).permit(:name,:date,:creator_id,:description,:attendees)
    end

end
