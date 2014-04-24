class CompanyProfile < ActiveRecord::Base
  belongs_to :company
  has_many :company_industries, dependent: :destroy
  has_many :industries, through: :company_industries
  has_many :locations, as: :profile, dependent: :destroy
end
