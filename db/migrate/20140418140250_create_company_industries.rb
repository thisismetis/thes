class CreateCompanyIndustries < ActiveRecord::Migration
  def change
    create_table :company_industries do |t|
      t.belongs_to :company, index: true
      t.belongs_to :industry, index: true

      t.timestamps
    end
  end
end
