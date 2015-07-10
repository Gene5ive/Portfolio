class Skill < ActiveRecord::Base
  has_many :projects

  validates :name, :description, :presence => true
end
