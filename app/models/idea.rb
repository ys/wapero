class Idea
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :description, :type => String

  attr_accessible :title, :description , :location
  belongs_to :creator , class_name: "User", inverse_of: :events_created

end