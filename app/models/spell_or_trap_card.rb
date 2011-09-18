require 'card'

# Kind represents the "type" or "icon" of spell and trap cards
class Kind
  include Mongoid::Document

  field :name, :type => String

  has_many :spell_or_trap_card

  validates_presence_of :name
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  
  key :name
end

# SpellOrTrapCard is not meant to be used directly, but is a parent class
# of spell and trap cards since they share almost everything in common
class SpellOrTrapCard < Card
  belongs_to :kind
end