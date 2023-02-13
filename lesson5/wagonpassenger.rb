require_relative 'wagon'
require_relative 'modules'

class WagonPassenger

  attr_reader :type

  def initialize
    @type = :passenger
    super
  end

end
