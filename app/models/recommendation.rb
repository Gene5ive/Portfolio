class Recommendation < ActiveRecord::Base
  validates :body, :name, :company, :presence => true

  attr_accessible :body, :name, :company
end
