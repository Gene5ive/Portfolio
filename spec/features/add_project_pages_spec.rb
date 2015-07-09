require 'rails_helper'

describe "the add a project process" do
  it "adds a new project" do
    visit projects_path
    click_on 'Add Project'
    fill_in 'Name', :with => 'Porfolio Project'
    fill_in 'Description', :with => 'Ruby on Rails, etc.'
    click_on 'Create Project'
    expect(page).to have_content 'Projects'
  end

  it "give an error when no name is entered" do
    visit new_project_path
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end
