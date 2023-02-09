module RailRoad
  attr_accessor :company
  def name_manufactured(name)
    self.company = name  
  end

  def name_manufactured
    self.company  
  end  
    
end