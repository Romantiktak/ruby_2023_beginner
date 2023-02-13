# Описание коасса Станция

class Station

  @@stations = []

  attr_accessor :trains
  def initialize(name_station)
    @name = name_station
    @trains = []
    @@stations << self
  end

  def arrival(train)
    self.trains << train
  end

  def departude(train)
    self.trains.delete(train)
  end

  def list_type_trains(type_train)
    puts "Список поездов на станции по типу #{type_train}"
    self.trains.each { |train| train if train.type == type_train }
  end

  def all_trains
    puts "Список всех поездов #{self.trains}"
  end

  def self.all
    @@stations
  end

end
