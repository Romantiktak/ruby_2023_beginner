# Описание коасса Станция
# frozen_string_literal: true

require_relative 'instance_counter'

# класс станций
class Station
  include InstanceCounter
  @@stations = []

  attr_reader :trains

  def initialize(name_station = nil)
    @name = name_station
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def arrival(train = nil)
    @trains << train
  end

  def departude(train = nil)
    @trains.delete(train)
  end

  def list_type_trains(type_train = nil)
    @trains.each { |train| train if train.type == type_train }
  end

  def all_trains
    @trains
  end

  def self.all
    @@stations
  end

  def validate?
    validate!
    true
  rescue StandardError
    false
  end

  def each_trains(&block)
    @trains.each_with_index { |train, index| block.call(train, index) }
  end

  private

  def validate!
    raise 'номер не может быть пустым' if @name.nil? || @name.empty?
  end
end
