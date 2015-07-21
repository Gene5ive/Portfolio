class Blog < ActiveRecord::Base
  has_many :comments

  validates :title, :body, :presence => true

  attr_accessible :title, :body
end
