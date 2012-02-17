require 'spec_helper'
describe "people/index.html.haml" do
it "displays the front page" do
  render
  p rendered
  rendered.should contain("LEPRA")
  end
end
