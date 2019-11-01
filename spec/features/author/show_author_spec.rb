require 'rails_helper'

describe "show author page", type: :feature do

  it 'should not raise any error to call show on an existing authors page' do
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
  end
end