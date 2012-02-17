require 'spec_helper'
describe "people/index.html.haml" do
it "displays the front page" do
  @people = []
  render
  rendered.should contain("Clinic")
  end
end
