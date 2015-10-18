require 'rails_helper'

describe "adding a tag" do
  it "adds a new tag" do
    visit tags_path
    click_link 'New Tag'
    fill_in 'Name', :with => 'Home'
    click_on 'Create Tag'
    expect(page).to have_content 'Posts'
  end

  it "gives error when no name is entered" do
    visit new_tag_path
    click_on 'Create Tag'
    expect(page).to have_content 'errors'
  end
end
