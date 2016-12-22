require 'rails_helper'

RSpec.describe "dogs/index", type: :view do
  before(:each) do
    assign(:dogs, [
      Dog.create!(),
      Dog.create!()
    ])
  end

  it "renders a list of dogs" do
    render
  end
end
