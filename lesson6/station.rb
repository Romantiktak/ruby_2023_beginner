# Описание коасса Станция
require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation
  @@stations = []

  attr_accessor :trains
  def initialize(name_station)
    @name = name_station
    @trains = []
    @@stations << self
    register_instance
    validate_name_attr!(name_station)
  end

  def arrival(train)
    self.trains << train
  end

  def departude(train)
    self.trains.delete(train)
  end

  def list_type_trains(type_train)
    self.trains.each { |train| train if train.type == type_train }
  end

  def all_trains
    self.trains
  end

  def self.all
    @@stations
  end

end
