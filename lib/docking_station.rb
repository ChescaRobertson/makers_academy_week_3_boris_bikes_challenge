require_relative './bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?()
    fail "This bike is broken" unless @bikes[-1].working?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  attr_reader :bike

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end