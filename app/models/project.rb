class Project < ActiveRecord::Base
  belongs_to :skill

  validates :name, :description, :presence => true

  attr_accessible :name, :description, :project_link

end
