require 'rails_helper'

describe "Edit author page", type: :feature do

  it "should render without error" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end

  it "should have text inputs for changing an author's first name, last name and homepage" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)

    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')

  end

  it "should be possible to update an authors first_name, last_name and homepage" do
    @author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    @author.update(first_name: 'Al', last_name: 'Tur', homepage: 'http://wikipedia.org/Al')
    @author.reload()
    expect(@author.first_name).to eq('Al')
    expect(@author.last_name).to eq('Tur')
    expect(@author.homepage).to eq('http://wikipedia.org/Al')
  end


end