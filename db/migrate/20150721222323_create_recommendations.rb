class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.column :body, :text
      t.column :name, :string
      t.column :company, :string

      t.timestamps
    end
  end
end
