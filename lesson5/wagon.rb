require_relative 'modules'

class Wagon
  include RailRoad

  attr_reader :type

  def initialize(type)
    @type = type
  end

end
