# frozen_string_literal: true

# модуль для подсчета инстанс-переменных
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # модуль для подсчета переменных класса
  module ClassMethods
    def instances
      @instances ||= 0
    end

    def add_instance
      @instances = 1 + instances
    end
  end

  # модуль  инстанс-методов
  module InstanceMethods
    private

    def register_instance
      self.class.add_instance
    end
  end
end
