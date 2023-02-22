
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances ||= 0
    end

    def add_instance
      @instances = 1 + instances
    end
  end
  module InstanceMethods
    
    private
    
    def register_instance
      self.class.add_instance
    end
  end

end
