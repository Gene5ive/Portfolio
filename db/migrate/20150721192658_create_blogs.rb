class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.column :title, :string
      t.column :body, :text

      t.timestamps
    end
  end
end
