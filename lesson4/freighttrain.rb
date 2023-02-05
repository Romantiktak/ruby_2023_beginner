# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'train'

class FreightTrain < Train

  def initialize(number, count=0)
    super
    @type = :freight
  end

end
