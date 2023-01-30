# load './railroad.rb'

class Station

  attr_accessor :trains
  def initialize(name_station)
    @name = name_station
    @trains = []
  end

  def arrival(train)
    self.trains << train
  end

  def departude(train)
    self.trains.delete(train)
  end

  # Типы поезда :freight :passenger, если тип не указан выведет все поезда
  def list_type_trains(type_train)
    puts "Список поездов на станции по типу #{type_train}"
    self.trains.each { |train| train if train.type == type_train }
  end

  def all_trains(type_train)
    puts "Список всех поездов #{self.trains}"
  end

end

class Routes

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

  def list_station
    puts "Список станций от начальной до конечной: #{self.stations}"
  end

end

class Train

  TYPES = [:freight, :passenger]
  attr_accessor :speed
  attr_accessor :wagons
  attr_accessor :station
  attr_reader :route

  def initialize(number, index_type, count)
    @number = number
    @type = TYPES[index_type] # 0 - грузовой, 1 - пассажирский
    @wagons = count
    @speed = 0
  end

  def increase_speed(speed = 10)
    self.speed += speed
    puts "Скорость увеличилась до #{self.speed}"
  end

  def current_speed
    puts "Текущая скорость поезда: #{self.speed}"
  end

  def stop
    self.speed = 0
    puts "Поезд остановлен"
  end

  def count_wagons
    puts "Количество вагонов в поезде: #{self.wagons}"
  end

  def attach_wagon
    self.wagons += 1 if self.speed.zero?
  end

  def dettach_wagon
    self.wagons -= 1 if self.speed.zero? && self.wagons > 0
  end

  def make_route(route)
    @route = route
    @station = route.stations.first
  end

  def go_ahead
    num_station = self.route.stations.index(@station)
    @station = self.route.stations[num_station + 1]
  end

  def go_back
    num_station = self.route.stations.index(@station)
    @station = self.route.stations[num_station - 1]
  end

end

arh = Station.new("Архангельск")
mos = Station.new("Москва")
yar = Station.new("Ярославль")
vol = Station.new("Вологда")
nn = Station.new("Н.-Новгород")

first_route = Routes.new(arh, nn)

# [:freight, :passenger]
pas_train = Train.new("115p", 1, 15)
fre_train = Train.new("226f", 0, 28)
