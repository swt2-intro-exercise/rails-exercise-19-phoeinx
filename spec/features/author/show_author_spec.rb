require 'rails_helper'

RSpec.describe Author, type: :model do

  it 'should show not raise any error to visit an existing authors page' do
    visit authors_path(@alan)
    expect(page).to have_text()
  end
end