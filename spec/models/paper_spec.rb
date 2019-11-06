require 'rails_helper'

RSpec.describe Paper, type: :model do

  it 'should not accept papers with empty values for title' do
    @paper = Paper.new(title: '', venue: 'Great venue', year: 144)
    expect(@paper).to_not be_valid
    @paper.update(title: 'Great title')
    expect(@paper).to be_valid
  end

  it 'should not accept papers with empty values for venue' do
    @paper = Paper.new(title: 'Great title', venue: '', year: 144)
    expect(@paper).to_not be_valid
    @paper.update(venue: 'Great venue')
    expect(@paper).to be_valid
  end

  it 'should not accept papers with empty values for year' do
    @paper = Paper.new(title: 'Great title', venue: 'Great venue', year: nil)
    expect(@paper).to_not be_valid
    @paper.update(year: 1)
    expect(@paper).to be_valid
  end

  it 'should not accept papers with non numerical values for year' do
    @paper = Paper.new(title: 'Great title', venue: 'Great venue', year: '1442')
    expect(@paper).to_not be_valid
    @paper.update(year: 1442)
    expect(@paper).to be_valid
  end

end
