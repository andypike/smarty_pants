RSpec.describe "Viewing the homepage" do
  it "displays the name of the site" do
    visit root_path

    expect(page).to have_content("Smarty Pants")
  end
end
