# Trap card
class Trap < SpellOrTrapCard
  belongs_to :trap_type, :inverse_of => nil
  
  validates_associated :trap_type
end