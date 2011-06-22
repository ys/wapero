class PossibleDate
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes 
  
  field :date, :type => DateTime
  embedded_in :event, :inverse_of => :possible_dates
  field :voters, :type => Array, :default => []
end