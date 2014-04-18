class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.belongs_to :company, index: true
      t.string :name
      t.integer :linkedin_id
      t.string :logo_url
      t.string :employee_count_range
      t.text :description

      t.timestamps
    end
  end
end
