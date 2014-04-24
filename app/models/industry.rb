class Industry < ActiveRecord::Base
  has_many :company_industries, dependent: :destroy
end
