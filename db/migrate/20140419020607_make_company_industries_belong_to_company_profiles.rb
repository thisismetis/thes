class MakeCompanyIndustriesBelongToCompanyProfiles < ActiveRecord::Migration
  def change
    remove_column :company_industries, :company_id
    add_column :company_industries,
      :company_profile_id,
      :integer,
      index: true
  end
end
