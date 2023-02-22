# Класс маршрута

require_relative 'instance_counter'

class Route

  include InstanceCounter
  attr_accessor :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
    register_instance
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def delete_station(station)
    # хочу вызвать исключение, которое запрещает удалять конечные станции, не получается
    delete_start_or_end_station(@stations)
    self.stations.delete(station)
  end

  def list_station
   self.stations
  end

  def validate?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise 'Минимальное количество станций равно двум' if self.stations.size < 2
  end

end
