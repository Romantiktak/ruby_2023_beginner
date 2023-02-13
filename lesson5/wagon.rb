require_relative 'modules'

class Wagon
  include RailRoad
  #attr_accessor :company
  attr_reader :type

  def initialize(type)
    @type = type
    @company
  end

end
