# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger

require_relative 'train'
require_relative 'manufactured'

class FreightTrain < Train

  attr_reader :number, :type, :wagons, :speed
  
  def self.find(number_train)
    super
  end

  def initialize(number, type = :freight)
    @type = type
    super
  end

   def attach_wagon(wagon)
    super
  end

  def dettach_wagon(wagon)
    super
  end

end
