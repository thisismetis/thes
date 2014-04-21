class CompanyProfile < ActiveRecord::Base
  belongs_to :company
  has_many :company_industries
  has_many :industries, through: :company_industries
  has_many :locations, as: :profile
end
