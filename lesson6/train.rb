# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'manufactured'
require_relative 'instance_counter'

class Train
  
  include Manufactured::InstanceMethods
  include InstanceCounter

  REG_EXP_NUMBER_TRAIN = /^[a-z|0-9]{3}-*[a-z|0-9]{2}/i

  def self.find(number_train)
    @@trains.detect { |train| train.number == number_train }
  end

  @@trains = []
  attr_accessor :speed, :wagons, :station
  attr_reader :type, :number, :type

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @wagons = []
    @speed = 0
    @company
    @@trains << self
    register_instance
  end

  def increase_speed(speed)
    self.speed += speed
  end

  def current_speed
    self.speed
  end

  def stop
    self.speed = 0
  end

  def count_wagons
    self.wagons
  end

  def attach_wagon(wagon)
    self.wagons << wagon if self.speed.zero? && self.type == wagon.type
  end

  def dettach_wagon(wagon)
    self.wagons.delete(wagon) if self.speed.zero?
  end

  def make_route(route)
    @route = route
    @station = route.stations.first
  end

  def go_ahead
    num_station = @route.stations.index(@station)
    self.station = @route.stations[num_station + 1]
  end

  def go_back
    num_station = @route.stations.index(@station)
    self.station = @route.stations[num_station - 1]
  end

  def current_station
    self.station
  end

  def validate?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise 'номер не может быть пустым' if number.nil? || number.length.zero?
    raise 'Неверный тип поезда' unless type == :freight || type == :passenger
    raise 'Неверный формат номера' if number !~ REG_EXP_NUMBER_TRAIN
  end

end
