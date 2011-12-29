require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @types = [Monster, Trap, Spell]
  end

  def all_types(&block)
    @types.each do |klass|
      yield klass
    end
  end

  def vpo_helper(klass, field, &init_block)
    card = klass.new
    yield card

    saved = card.save
    assert !saved, "Saved a #{card.class.name} card without a #{field}"
    assert card.errors.messages.key?(field), "#{card.class.name} doesn't have an error on #{field}"
    assert card.errors.messages[field].include?("can't be blank"), "#{card.class.name} doesn't seem to have a \"can't be blank\" error for #{field}"
  end

  test "all cards require a card number" do
    all_types do |klass|
      vpo_helper(klass, :number) do |card|
        card.name = 'name'
        card.description = 'description'
      end
    end
  end

  test "all cards require a card name" do
    all_types do |klass|
      vpo_helper(klass, :name) do |card|
        card.number = 'HA-1234'
        card.description = 'description'
      end
    end
  end

  test "all cards require a card description" do
    all_types do |klass|
      vpo_helper(klass, :description) do |card|
        card.name = 'name'
        card.number = 'HA-12345'
      end
    end
  end
  
  test "all cards default to quantity of 1" do
    all_types do |klass|
      c = klass.new
      assert c.quantity == 1, "expect default quantity of 1 for #{c.class.name}"
    end
  end

  test "all cards have a minimum quantity of 0" do
    all_types do |klass|
      c = klass.new
      c.quantity = -1
      saved = c.save
      assert !saved, "Saved a card with a negative quantity"
      assert c.errors.messages.include?(:quantity), "Should be an error for quantity"
    end
  end

  test "all cards have a quantity field that is an Integer" do
    all_types do |klass|
      c = klass.new
      c.quantity = 0.4

      c.name = 'name'
      c.description = 'description'
      c.number = 'number'

      saved = c.save
      assert !saved, "Saved a non-Integer for quantity"
      assert c.errors.messages.include?(:quantity), "#{c.class.name} should have an error on quantity since it's a non-Integer: #{c.inspect}\n#{c.errors}"
    end
  end

end
