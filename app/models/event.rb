class Event
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes 
  field :title, :type => String
  field :event_day, :type => DateTime
  field :description, :type => String
  field :location, :type => String
  field :geocoded, :type => Hash
  field :has_date, :type => Boolean, :default => false
  attr_accessible :title, :event_day, :possible_dates,:possible_dates_attributes, :description , :users, :location, :geocoded, :has_date
  belongs_to :creator , class_name: "User", inverse_of: :events_created
  has_and_belongs_to_many :users, :inverse_of => :events
  
  embeds_many :comments
  embeds_many :possible_dates
  accepts_nested_attributes_for :possible_dates
  scope :future , desc("event_day").where(:event_day.gte => Time.now)
  scope :past , desc("event_day").where(:event_day.lte => Time.now)
  
  index :event_day
  index :title
end
