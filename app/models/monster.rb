require 'card'
# Monster models

# Monster attribute
class Attribute
  include Mongoid::Document
  
  field :name, :type => String

  has_many :card

  validates_presence_of :name
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  
  key :name
end

# Monster card
class Monster < Card
  field :level, :type => Integer, :default => 3
  field :attack_points, :type => Integer
  field :defense_points, :type => Integer
  field :tuner, :type => Boolean, :default => false

  belongs_to :attribute
  belongs_to :monster_type
  has_and_belongs_to_many :effect

  validates_presence_of :level
  validates_presence_of :attack_points
  validates_presence_of :defense_points

  validates_numericality_of :level, :greater_than_or_equal_to => 1
  validates_numericality_of :attack_points, :greater_than_or_equal_to => 0
  validates_numericality_of :defense_points, :greater_than_or_equal_to => 0
end


# Effects for Monster cards
class Effect
  include Mongoid::Document

  field :name, :type => String

  has_and_belongs_to_many :monster_card

  validates_presence_of :name
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  
  key :name
end

# Monster card types such as Normal, Synchro, Fusion, Ritual
class MonsterType
  include Mongoid::Document

  field :name, :type => String

  has_many :monster_card

  validates_presence_of :name
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  
  key :name
end
