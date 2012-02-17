require 'spec_helper'
describe "lepra2/index.html.haml" do
it "displays the front page of the website" do
  render
  rendered.should contain("LEPRA")
  end
end
