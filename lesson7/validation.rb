# frozen_string_literal: true

# Модуль для проверки объектов
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # модуль для расширения вызова методов класса
  module ClassMethods
  end

  # модуль для проверки инстанс переменных
  module InstanceMethods
    REG_EXP_NUMBER_TRAIN = /^[a-z|0-9]{3}-*[a-z|0-9]{2}/i
    def validate_name_attr?(name_or_number = nil)
      validate_name_attr!(name_or_number)
      true
    rescue StandardError
      false
    end

    protected

    # решил одним методом проверять и имя и номер класса
    def validate_name_attr!(name_attr = nil)
      raise 'номер или наименование не может быть пустым' if name_attr.nil? || name_attr.empty?
    end

    def delete_start_or_end_station(_stations = nil)
      raise 'Нельзя удалять конечные станции' if stations.first != station && stations.last != station
    end

    def validate_number_train!(number = nil)
      raise 'Неверный формат номера' if number !~ REG_EXP_NUMBER_TRAIN
    end
  end
end
