class Reference < ActiveRecord::Base
  validates :name, :company, :contact, :presence => true

  attr_accessible :name, :company, :contact
end
