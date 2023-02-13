require_relative 'wagon'
require_relative 'modules'

class WagonFreight
  include RailRoad
  attr_reader :type

  def initialize
    @type = :freight
    super
  end

end
