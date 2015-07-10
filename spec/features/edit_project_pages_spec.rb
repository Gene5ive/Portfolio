require 'rails_helper'

describe "the edit a skill process" do
  it "edits a skill" do
    skill = Skill.create(:name => 'Ruby', :description => 'Ruby on Rails, etc.')
    project = Project.create(:name => 'Portfolio Project', :description => 'Scalable web app framework written in Ruby', :skill_id => skill.id)
    visit skill_project_path(project)
    click_on 'Edit'
    fill_in 'Name', :with => 'Integration Testing'
    fill_in 'Description', :with => 'Capybara/RSpec testing'
    click_on 'Update Project'
    expect(page).to have_content 'Success'
  end
end
