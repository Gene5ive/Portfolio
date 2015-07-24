require 'rails_helper'

describe Recommendation do
  it { should validate_presence_of :body }
  it { should validate_presence_of :name }
  it { should validate_presence_of :company }
end
