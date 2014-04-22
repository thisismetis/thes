class AddLevelFieldToProficienciesTable < ActiveRecord::Migration
  def change
    add_column :proficiencies, :level, :integer
  end
end
