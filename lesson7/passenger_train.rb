# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger
# frozen_string_literal: true

require_relative 'train'
require_relative 'manufactured'

# класс пассадирских поездов
class PassengerTrain < Train
  attr_reader :number, :type, :wagons, :speed

  def self.find(number_train = nil)
    super
  end

  def initialize(number = nil, type = :passenger)
    super
    @type = type
  end

  def attach_wagon(wagon = nil)
    super
  end

  def dettach_wagon(wagon = nil)
    super
  end
end
