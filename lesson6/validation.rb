module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  end

  module InstanceMethods
    REG_EXP_NUMBER_TRAIN = /^[a-z|0-9]{3}-*[a-z|0-9]{2}/i
    def validate_name_attr?(name_or_number)
      validate_name_attr!(name_or_number)
      true
    rescue
      false
    end

    protected
    # решил одним методом проверять и имя и номер класса
    def validate_name_attr!(name_attr)
      raise 'номер или наименование не может быть пустым' if name_attr.nil? || name_attr.length.zero?
    end

    def delete_start_or_end_station(stations)
      raise 'Нельзя удалять конечные станции' if self.stations.first != station && self.stations.last != station
    end

    def validate_number_train!(number)
      raise 'Неверный формат номера' if number !~ REG_EXP_NUMBER_TRAIN
    end
  
  end

end