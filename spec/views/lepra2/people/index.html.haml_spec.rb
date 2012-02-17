require 'spec_helper'
describe "people/index.html.haml" do
  it "displays the front page" do
    @people = Person.search("","")  # params[:search], params[:is_anywhere], params[:clinic_id])
    render
    rendered.should contain("Clinic")
    rendered.should contain("0 matches")
  end

  it "should one hit after adding a person" do
    person = stub_model(Person,
      :name => "Test User"
    )

    # @people = Person.search("","")  # params[:search], params[:is_anywhere], params[:clinic_id])
    @people = [ person ]
    render
    rendered.should contain("Clinic")
    rendered.should contain("1 matches")
    rendered.should contain("Test User")
  end
end
