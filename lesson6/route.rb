# Класс маршрута

require_relative 'instance_counter'
require_relative 'validation'

class Route

  include InstanceCounter
  include Validation
  attr_accessor :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
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

end
