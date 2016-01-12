RSpec.describe "Parent signing up for an account" do
  it "displays the sign up page" do
    visit root_path
    click_on "Sign up"

    expect(page).to have_title(/sign up/i)
  end
end
