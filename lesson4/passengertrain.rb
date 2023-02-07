# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'train'

class PassengerTrain < Train

  attr_reader :number, :type, :wagons, :speed

  def initialize(number)
    @number = number
    @type = :passenger
    @wagons = []
    @speed = 0
  end

  def attach_wagon(wagon)
    super
  end

  def dettach_wagon(wagon)
    super
  end

end
