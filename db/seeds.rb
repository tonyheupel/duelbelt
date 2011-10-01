# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def create_name_only_items(collection, klass)
  unless klass.count == collection.length
    collection.each { |name| klass.create(name: name) }
  end
end

create_name_only_items(%w{ Dark Earth Fire Light Water Wind }, Attribute)
#create_name_only_items(%w{ Flip Continuous Ignition Trigger Quick }, MonsterEffect)
create_name_only_items(%w{ Normal Synchro Fusion Ritual }, MonsterType)
create_name_only_items(%w{ Normal Continuous Eqiup Field QuickPlay Ritual }, SpellType)
create_name_only_items(%w{ Normal Continuous Counter }, TrapType)
create_name_only_items(%w{
                        Warrior
                        Winged Beast
                        Dragon
                        Fairy
                        Fiend
                        Machine
                        Devine
                        Gemini
                        Spellcaster
                        Fish
                        Serpent
                        Rock
                        Reptile
                        Pyro
                        Insect
                        Plant
                      }, MonsterKind)

