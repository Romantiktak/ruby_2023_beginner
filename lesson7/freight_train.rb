# Подключаю класс маршрута к классу Train
# Типы поезда :freight :passenger
# frozen_string_literal: true

require_relative 'train'
require_relative 'manufactured'

# класс для грузовых вагонов
class FreightTrain < Train
  attr_reader :number, :type, :wagons, :speed

  def self.find(number_train = nil)
    super
  end

  def initialize(number, type = :freight)
    @type = type
    super
  end

  def find(number = nil)
    super
  end

  def attach_wagon(wagon = nil)
    super
  end

  def dettach_wagon(wagon = nil)
    super
  end
end
