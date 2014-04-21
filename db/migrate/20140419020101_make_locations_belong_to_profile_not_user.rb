class MakeLocationsBelongToProfileNotUser < ActiveRecord::Migration
  def change
    remove_column :locations, :user_id
    remove_column :locations, :user_type
    add_column :locations, :profile_id, :integer
    add_column :locations, :profile_type, :string
  end
end
