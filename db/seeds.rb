# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Attribute.count == 0
  %w{ Dark Earth Fire Light Water Wind }.each { |name| Attribute.create(name: name) }
end

if MonsterEffect.count == 0
  %w{ Flip Continuous Ignition Trigger Quick }.each { |name| MonsterEffect.create(name: name) }
end

if MonsterType.count == 0
  %w{ Normal Synchro Fusion Ritual }.each { |name| MonsterType.create(name: name) }
end