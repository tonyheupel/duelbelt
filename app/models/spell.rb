# Spell card
class Spell < SpellOrTrapCard
  belongs_to :spell_type, :inverse_of => nil
end