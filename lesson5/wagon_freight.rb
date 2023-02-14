require_relative 'wagon'
require_relative 'manufactured'

class WagonFreight
  include Manufactured::InstanceMethods
  attr_reader :type

  def initialize
    @type = :freight
    super
  end

end
