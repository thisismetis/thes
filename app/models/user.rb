class User < ActiveRecord::Base
  has_one :oauth, class_name: "LinkedinOauthSetting", dependent: :destroy
end
