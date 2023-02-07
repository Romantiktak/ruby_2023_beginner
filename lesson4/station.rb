# Описание коасса Станция

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

  def list_type_trains(type_train)
    puts "Список поездов на станции по типу #{type_train}"
    self.trains.each { |train| train if train.type == type_train }
  end

  def all_trains
    puts "Список всех поездов #{self.trains}"
  end

end
