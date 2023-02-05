# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'train'

class PassengerTrain < Train

  def initialize(number, count=0)
    super
    @type = :passenger
  end

end
