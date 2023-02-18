# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'manufactured'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  
  include Manufactured::InstanceMethods
  include InstanceCounter
  include Validation

  def self.find(number_train)
    @@trains.detect { |train| train.number == number_train }
  end

  @@trains = []
  attr_accessor :speed, :wagons, :station
  attr_reader :type, :number, :type

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @company
    @@trains << self
    register_instance
    validate_name_attr!(number)
    validate_number_train!(number)
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

end
