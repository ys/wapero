class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :comment_body, :type => String
  embedded_in :event, :inverse_of => :comments
  referenced_in :author, :class_name => "User"
  scope :lifo, desc(:created_at)
end
