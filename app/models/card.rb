# Trading card game card abstract class/collection
class Card
  include Mongoid::Document

  field :number, :type => String
  field :name, :type => String
  field :description, :type => String
  field :image_url, :type => String
  field :quantity, :type => Integer, :default => 1

  # additional items of interest that a card can have "something to do with"
  field :tokens, :type => Boolean
  field :counters, :type => Boolean
  field :coins, :type => Boolean
  field :dice, :type => Boolean

  validates_presence_of :number
  validates_presence_of :name
  validates_presence_of :description
  
  validates_uniqueness_of :number, :on => :create, :message => "must be unique"

  validates_numericality_of :number, :greater_than_or_equal_to => 0

  key  :number # only unique field for a card
  slug :number # ensure url-friendly numbering--this is the only unique field
end

# Spell and trap card models

# Kind represents the "type" or "icon" of spell and trap cards
class Kind
  include Mongoid::Document

  field :name, :type => String

  has_many :spell_or_trap_card

  validates_presence_of :name
end

# SpellOrTrapCard is not meant to be used directly, but is a parent class
# of spell and trap cards since they share almost everything in common
class SpellOrTrapCard < Card
  belongs_to :kind
end

# Spell card
class Spell < SpellOrTrapCard
end

# Trap card
class Trap < SpellOrTrapCard
end

# Monster models

# Monster attribute
class Attribute
  include Mongoid::Document
  
  field :name, :type => String

  has_many :card

  validates_presence_of :name
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
end

# Monster card types such as Normal, Synchro, Fusion, Ritual
class MonsterType
  include Mongoid::Document

  field :name, :type => String

  has_many :monster_card

  validates_presence_of :name
end
