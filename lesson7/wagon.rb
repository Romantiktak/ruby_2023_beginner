# frozen_string_literal: true

require_relative 'manufactured'

# родительский класс для вагонов
class Wagon
  include Manufactured::InstanceMethods
  attr_reader :type, :limit_places, :free_places

  def initialize(type = nil, _places = 0)
    @type = type
    @company = nil
  end
end
