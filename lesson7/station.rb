# Описание коасса Станция
require_relative 'instance_counter'

class Station
  include InstanceCounter
  @@stations = []

  attr_accessor :trains
  def initialize(name_station)
    @name = name_station
    validate!
    @trains = []
    @@stations << self
    register_instance
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

  def validate?
    validate!
    true
  rescue
    false
  end

  def each_trains(&block)
    self.trains.each { |train| yield(train)}
  end

  private

  def validate!
    raise 'номер не может быть пустым' if @name.nil? || @name.length.zero?
  end

end
