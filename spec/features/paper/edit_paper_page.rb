equire 'rails_helper'

describe "Edit paper page", type: :feature do

  it "should render without error" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
  end

  it "should have text inputs for changing an paper's title, venue and year" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)

    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')

  end

  it "should be possible to update an papers first_name, last_name and homepage" do
    @paper = paper.new(title: 'Great Title', venue: 'Great venue', year: 1442)
    @paper.update(title: 'Great', venue: 'Great', year: 144)
    @paper.reload()
    expect(@paper.title).to eq('Great')
    expect(@paper.venue).to eq('Great')
    expect(@paper.year).to eq(144)
  end

  it 'should have a single multiple select box' do
    #doesnt really test as of now
    visit edit_paper_path(@paper)
    expect(page).to have_css("select")
  end

  it "should be possible to add multiple authors to a paper" do
    @paper = paper.new(title: 'Great Title', venue: 'Great venue', year: 1442)
    @author = FactoryBot.create :author
    @plagiatist = FactoryBot.create :author
    @plagiatist.update(last_name: 'P')
    @paper.authors << @author
    @paper.authors << @plagiatist
    visit edit_paper_path(@paper)
    expect(paper_path(@paper)).to have_text(@author.name)
    expect(paper_path(@paper)).to have_text(@plagiatist.name)
  end



end