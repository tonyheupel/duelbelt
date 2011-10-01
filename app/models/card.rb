# Trading card game card abstract class/collection
class Card
  include Mongoid::Document
  include Mongoid::Slug
  
  field :number,      :type => String
  field :name,        :type => String
  field :description, :type => String
  field :image_url,   :type => String
  field :quantity,    :type => Integer, :default => 1
  
  # additional items of interest that a card can have "something to do with"
  field :tokens,    :type => Boolean, :default => false
  field :counters,  :type => Boolean, :default => false
  field :coins,     :type => Boolean, :default => false
  field :dice,      :type => Boolean, :default => false

  belongs_to :rarity, :inverse_of => nil
  
  [:number, :name, :description].each do |field|
    validates_presence_of field
  end
  
  validates_uniqueness_of :number

  validates_numericality_of :quantity, :greater_than_or_equal_to => 0, :only_integer => true

  validates_associated :rarity
  
  key  :number # only unique field for a card
  slug :number # ensure url-friendly numbering--this is the only unique field
end
