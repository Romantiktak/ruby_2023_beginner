# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require "route.rb"

class Train

  TYPES = [:freight, :passenger]
  attr_accessor :speed
  attr_accessor :wagons

  def initialize(number, index_type, count)
    @number = number
    @type = TYPES[index_type]
    @wagons = count
    @speed = 0
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

  def attach_wagon
    self.wagons += 1 if self.speed.zero?
  end

  def dettach_wagon
    self.wagons -= 1 if self.speed.zero? && self.wagons > 0
  end

  def make_route(route)
    @route = route
    @station = route.first
  end

  def go_ahead
    num_station = @route.index(@station)
    @station = route[num_station + 1]
  end

  def go_back
    num_station = @route.index(@station)
    @station = route[num_station - 1]
  end



end
