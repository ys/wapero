class Event
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes 
  field :title, :type => String
  field :event_day, :type => DateTime
  field :description, :type => String
  field :location, :type => String
  field :geocoded, :type => Hash
  attr_accessible :title, :event_day, :description , :users, :location, :geocoded
  belongs_to :creator , class_name: "User", inverse_of: :events_created
  has_and_belongs_to_many :users, :inverse_of => :events
  embeds_many :comments
  scope :future , desc("event_day").where(:event_day.gte => Time.now)
  scope :past , desc("event_day").where(:event_day.lte => Time.now)
end
