class AddSkillIdToProjectsTable < ActiveRecord::Migration
  def change
    add_column :projects, :skill_id, :integer
  end
end
