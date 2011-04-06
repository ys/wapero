class Event
  include Mongoid::Document
  field :event_day, :type => Date
  field :description, :type => String
  field :title, :type => String
end
