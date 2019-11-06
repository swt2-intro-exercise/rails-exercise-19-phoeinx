require 'rails_helper'

describe "show paper page", type: :feature do

  it 'should not raise any error to call show on an existing papers page' do
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.venue)
    expect(page).to have_text(@paper.year)
  end

  it 'should show the full name of the papers author' do
    @paper = FactoryBot.create :paper
    @author = FactoryBot.create :author
    @paper.authors << @author
    visit paper_path(@paper)
    @paper.authors.each {
      |author| expect(page).to have_text(author.name)
    }
  end
end