require 'rails_helper'

describe "adding a post" do
  it "adds a new post" do
    visit tags_path
    new_tag = Tag.create(name: "Home")
    visit new_tag_post_path(new_tag)
    fill_in 'Title', :with => 'Furniture decorations'
    fill_in 'Author', :with => 'KA'
    fill_in 'Body', :with => 'A blanket.'
    click_on('Create Post')
    expect(page).to have_content new_tag.name
  end

  it "gives error when no name is entered" do
    new_tag = Tag.create(name: "Home")
    visit new_tag_post_path(new_tag)
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end
