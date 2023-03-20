# frozen_string_literal: true

# модуль для определения производителя
module Manufactured
  # модуль для инстанс методов
  module InstanceMethods
    def set_manufactured(name = nil)
      @company = name
    end

    def get_manufactured
      @company
    end
  end
end
