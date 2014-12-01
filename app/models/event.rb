class Event < ActiveRecord::Base
  def index
    @events = Event.all
  end
end
