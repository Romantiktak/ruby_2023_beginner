# frozen_string_literal: true

require_relative 'instance_counter'

# Класс маршрута
class Route
  include InstanceCounter
  attr_accessor :stations

  def initialize(start_station = nil, end_station = nil)
    @stations = [start_station, end_station]
    validate!
    register_instance
  end

  def add_station(station = nil)
    stations.insert(-2, station)
  end

  def delete_station(station = nil)
    # хочу вызвать исключение, которое запрещает удалять конечные станции, не получается
    delete_start_or_end_station(@stations)
    stations.delete(station)
  end

  def list_station
    stations
  end

  def validate?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    raise 'Минимальное количество станций равно двум' if stations.size < 2
  end
end
