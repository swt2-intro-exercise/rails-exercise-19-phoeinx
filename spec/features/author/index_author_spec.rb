require 'rails_helper'

describe "Index author page", type: :feature do

  it 'should render without error' do
    visit authors_path
  end

  it 'should have table with headings Name and Homepage' do
     visit authors_path
     expect(page).to have_text("Name")
     expect(page).to have_text('Homepage')
  end

  it 'should have link to individual authors detail pages' do
     @alan = FactoryBot.create :author
     visit authors_path
     expect(page).to have_link 'Show', href: author_path(@alan)
  end

  it 'should show name and homepage of individual author' do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_text(@alan.name)
    expect(page).to have_text(@alan.homepage)
  end
  it 'should have link to add new author page' do
    visit authors_path
    expect(page).to have_link 'New author', href: new_author_path
  end


end