class Event
  include Mongoid::Document
  field :event_day, :type => Date
  field :description, :type => String
  field :title, :type => String
  has_and_belongs_to_many :users
end
