class CompanyProfile < ActiveRecord::Base
  belongs_to :company
  has_many :company_industries
  has_many :company_locations
  has_many :industries, through: :company_industries
  has_many :locations, through: :company_locations
end
