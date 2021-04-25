Given(/^I am on the homepage$/) do
    visit root_path
end

Given(/^I am logged in$/) do
    visit signup_path
    fill_in('user_username', with: 'Test_Username_68419')
    fill_in('user_email', with: 'testuser@gmail.com')
    fill_in('user_password', with: 'testpassword')
    fill_in('user_vPassword', with: 'testpassword')
    click_button('Create Account')
    visit root_path
end

Given(/^I am not logged in$/) do

end

When(/^I attempt to create a new post$/) do
    visit new_post_path
end

When(/^I submit the new post form$/) do
    fill_in('post_post_title', with: '')
    fill_in('post_post_description', with: '')
    fill_in('post_project_motivation', with: '')
    fill_in('post_github_repo_link', with: '')
    fill_in('post_project_motivation', with: '')
    click_button("Save Changes")
end

Then(/^I should be redirected to the homepage$/) do
    expect(page).to have_text('Login')
end

Then(/^I should be brought to the new post form$/) do
    expect(page).to have_text('Create New Post')
end

Then(/^I should be able to find my post on the list of all posts$/) do
    expect(page).to have_text('was successfully created')
end