require 'rails_helper'

describe 'the rooth path' do
  it 'visits the home page' do
    visit root_path
    expect(page).to have_content 'Gene Johnson'
  end
end
