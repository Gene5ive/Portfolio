class SwitchPolymorphicRelationship < ActiveRecord::Migration
  def change
    remove_column :skills, :project_id
  end
end
