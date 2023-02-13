# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'modules'

class Train

  include RailRoad
  @@trains = []
  #TYPES = [:freight, :passenger]
  attr_accessor :speed, :wagons, :station
  attr_reader :type, :number, :type

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @company
    @@trains << self
  end

  def increase_speed(speed)
    self.speed += speed
    puts "Скорость увеличилась до #{self.speed}"
  end

  def current_speed
    puts "Текущая скорость поезда: #{self.speed}"
  end

  def stop
    self.speed = 0
    puts "Поезд остановлен"
  end

  def count_wagons
    puts "Количество вагонов в поезде: #{self.wagons}"
  end

  def attach_wagon(wagon)
    self.wagons << wagon if self.speed.zero? && self.type == wagon.type
    # Подскажите как мне здесь обратиться к методу protected type из класса WagonPassenger
  end

  def dettach_wagon(wagon)
    self.wagons.delete(wagon) if self.speed.zero?
  end

  def make_route(route)
    @route = route
    @station = route.stations.first
    puts "Поезд стоит на станции маршрута: #{@station}"
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

  def self.find(number_train)
    @@trains.detect { |train| train.number == number_train }
  end

end
