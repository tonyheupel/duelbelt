# Monster attribute
class Attribute
  include Mongoid::Document
  
  field :name, :type => String

  has_many :monster

  validates_presence_of :name
  validates_uniqueness_of :name
  
  key :name
end