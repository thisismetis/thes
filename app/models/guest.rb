class Guest
  extend ActiveModel::Naming

  def id
    -1
  end

  def persisted?
    false
  end
end
