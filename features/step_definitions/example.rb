Given("I am going to example.com") do
  visit('http://example.com')
end

Then("I should see example page") do
  expect(page).to have_content('Example Domain')
end
