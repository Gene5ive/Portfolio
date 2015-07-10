FactoryGirl.define do
  factory(:project) do
    name('Portfolio Project')
    description('Ruby on Rails Web App')
  end

  factory(:skill) do
    name('Testing')
    description('Front-and-back-end testing')
  end
end
