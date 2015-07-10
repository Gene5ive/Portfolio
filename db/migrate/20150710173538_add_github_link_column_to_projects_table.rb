class AddGithubLinkColumnToProjectsTable < ActiveRecord::Migration
  def change
    add_column :projects, :project_link, :string
  end
end
