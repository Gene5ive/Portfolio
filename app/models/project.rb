class Project < ActiveRecord::Base
  belongs_to :skill

  validates :name, :description, :presence => true
end
