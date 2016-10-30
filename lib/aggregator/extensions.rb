# Define methods to be added to core Ruby classes

class String
  def demodulize
    self.split('::').last
  end
end
