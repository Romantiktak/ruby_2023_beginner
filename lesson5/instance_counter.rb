
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      COUNT_INSTANCE ||= 0
    end
  end
  module InstanceMethods
    def register_instance
      instances # хочу при первом вызове определить константу COUNT_INSTANCE в ноль
      self.class.COUNT_INSTANCE += 1 # после чего увеличить на единицу 
    end
  end

end