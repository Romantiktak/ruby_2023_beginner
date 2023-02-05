# Класс маршрута

class Route

  attr_accessor :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    self.stations.insert(-2, station)
    puts "Станция #{station} добавлена"
  end

  def delete_station(station)
    if self.stations.first != station && self.stations.last != station
      self.stations.delete(station)
      puts "Станция #{station} удалена"
    else
      puts "Нельзя удалять конечные станции"
    end
  end

  # метод используется только внутри класса
  private

  def list_station
    puts "Список станций от начальной до конечной: #{self.stations}"
  end

end
