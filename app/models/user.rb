class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  field :name
  field :role
  field :twitter_name
  validates_presence_of :name
  validates_presence_of :role
  validates_presence_of :twitter_name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :twitter_name,:authentications, :role, :email, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :events
end
