# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'train'
require_relative 'modules'

class PassengerTrain < Train

  attr_reader :number, :type, :wagons, :speed

  def initialize(number, type = :passenger)
    super
    @type = type
  end

  def attach_wagon(wagon)
    super
  end

  def dettach_wagon(wagon)
    super
  end

end
