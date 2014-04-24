class LinkedinOauthSetting < ActiveRecord::Base
  belongs_to :user

  def user
    super || Guest.new
  end
end
