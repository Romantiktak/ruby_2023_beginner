require_relative 'manufactured'

class Wagon
  include Manufactured::InstanceMethods
  attr_reader :type

  def initialize(type)
    @type = type
    @company
  end

end
