# Monster card
class Monster < Card
  field :level,              :type => Integer, :default => 3
  field :attack_points,      :type => Integer, :default => 1000
  field :defense_points,     :type => Integer, :default => 1000
  field :is_tuner,           :type => Boolean, :default => false
  field :is_effect,          :type => Boolean, :default => false

  belongs_to :attribute,      :inverse_of => nil
  belongs_to :monster_type,   :inverse_of => nil  # Normal, Synchro, Fusion, Ritual
  belongs_to :monster_kind,   :inverse_of => nil  # Warrior, Spellcaster, Fairy, etc.
  
  [:attribute, :monster_type, :monster_kind].each do |field|
    validates_presence_of field
  end
  
  [:attribute, :monster_type, :monster_kind].each do |field|
    validates_associated field
  end
  
  [:attack_points, :defense_points].each do |field|
    validates_presence_of     field
    validates_numericality_of field, :greater_than_or_equal_to => 0    
  end
  
  validates_presence_of     :level
  validates_numericality_of :level, :greater_than_or_equal_to => 1
  
  def effect?
    is_effect
  end
  
  def tuner?
    is_tuner
  end
  
end
