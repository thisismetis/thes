class Guest
  def persisted?
    false
  end

  def type
    self.class
  end
end
