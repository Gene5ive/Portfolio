require 'rails_helper'

describe "the edit a skill process" do
  it "edits a skill" do
    project = Project.create(:name => 'Portfolio Project', :description => 'Ruby on Rails, etc.')
    skill = Skill.create(:name => 'Ruby on Rails', :description => 'Scalable web app framework written in Ruby', :project_id => project.id)
    visit project_skill_path(skill)
    click_on 'Edit'
    fill_in 'Name', :with => 'Integration Testing'
    fill_in 'Description', :with => 'Capybara/RSpec testing'
    click_on 'Update Skill'
    expect(page).to have_content 'Success'
  end
end
