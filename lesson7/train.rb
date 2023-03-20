# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger
# frozen_string_literal: true

require_relative 'manufactured'
require_relative 'instance_counter'

# класс поездов
class Train
  include Manufactured::InstanceMethods
  include InstanceCounter

  REG_EXP_NUMBER_TRAIN = /^[a-z|0-9]{3}-*[a-z|0-9]{2}/i

  def self.find(number_train = nil)
    @@trains.detect { |train| train.number == number_train }
  end

  @@trains = []
  attr_accessor :speed, :wagons, :station
  attr_reader :type, :number, :type

  def initialize(number = nil, type = nil)
    @number = number
    @type = type
    validate!
    @wagons = []
    @speed = 0
    @company
    @@trains << self
    register_instance
  end

  def increase_speed(speed = 0)
    self.speed += speed
  end

  def current_speed
    self.speed
  end

  def stop
    self.speed = 0
  end

  def count_wagons
    wagons
  end

  def attach_wagon(wagon = nil)
    wagons << wagon if self.speed.zero? && type == wagon.type
  end

  def dettach_wagon(wagon = nil)
    wagons.delete(wagon) if self.speed.zero?

  def go_ahead
    num_station = @route.stations.index(@station = nil)
    self.station = @route.stations[num_station + 1]
  end

  def go_back
    num_station = @route.stations.index(@station)
    self.station = @route.stations[num_station - 1]
  end

  def current_station
    station
  end

  def validate?
    validate!
    true
  rescue StandardError
    false
  end

  def each_wagons(&block)
    @wagons.each_with_index { |wagon, index| block.call(wagon, index) }
  end

  private

  def validate!
    raise 'номер не может быть пустым' if number.nil? || number.length.zero?
    raise 'Неверный тип поезда' unless type == :freight || type == :passenger
    raise 'Неверный формат номера' if number !~ REG_EXP_NUMBER_TRAIN
  end
end
