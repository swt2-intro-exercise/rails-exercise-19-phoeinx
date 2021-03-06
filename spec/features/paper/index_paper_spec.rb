require 'rails_helper'

describe "Index paper page", type: :feature do

  it 'should render without error' do
    visit papers_path
  end

  it 'should have table with headings title and year' do
    visit papers_path
    expect(page).to have_css('table')
    expect(page).to have_text('Title')
    expect(page).to have_text('Year')
  end

  it 'should have link to individual papers detail pages' do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link 'Show', href: paper_path(@paper)
  end

  it 'should show name and homepage of individual paper' do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.year)
  end

  it 'should have link to add new paper page' do
    visit papers_path
    expect(page).to have_link 'New Paper', href: new_paper_path
  end

  it 'should have link to delete an individual papers page' do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link 'Delete', href: paper_path(@paper)
  end

  it 'should destroy paper' do
    @paper = FactoryBot.create :paper
    expect{@paper.destroy}.to change{Paper.count}.by(-1)
  end

  it 'should only show papers published in year 1950 when using page with url parameter year=1950' do
    @paper1950 = FactoryBot.create :paper
    @paper1950.update(year: 1950)
    @paper1968 = FactoryBot.create :paper
    @paper1968.update(year: 1968)
    visit papers_path + '?year=1950'
    expect(page).to have_text(@paper1950.year)
    expect(page).to_not have_text(@paper1968.year)
  end

end