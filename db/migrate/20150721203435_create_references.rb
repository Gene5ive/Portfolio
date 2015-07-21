class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.column :name, :string
      t.column :company, :string
      t.column :contact, :string
    end
  end
end
