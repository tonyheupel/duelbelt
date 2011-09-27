# Effects for Monster cards
class MonsterEffect
  include Mongoid::Document

  field :name, :type => String

  # has_and_belongs_to_many :monster_card

  validates_presence_of :name
  validates_uniqueness_of :name
  
  key :name
end
