require 'rails_helper'

describe "the skill feature process" do
  it "adds a new skill" do
    visit skills_path
    click_on 'Add Skill'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby on Rails, etc.'
    click_on 'Create Skill'
    expect(page).to have_content 'Skill successfully added!'
  end

  it "edits an existing skill" do
    skill = FactoryGirl.create(:skill)
    visit edit_skill_path(skill)
    fill_in "Description", with: "RSpec and Capybara"
    click_on "Update Skill"
    expect(page).to have_content("Skill successfully updated!")
  end

  it "deletes a skill" do
    skill = FactoryGirl.create(:skill)
    visit skills_path(skill)
    click_on "Delete"
    expect(page).to have_content("Skill successfully deleted!")
  end

  it "gives an error when no name is entered" do
    visit new_skill_path
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end
end
