require 'rails_helper'

describe "New author page", type: :feature do

 it "should render without error" do
   visit new_author_path
 end
end