When(/^I go to the new user form$/) do
    visit new_user_path
end

When(/^I fill out the entire signup form correctly and submit it$/) do
    fill_in("user_profile_picture_link", with: "https://media-exp1.licdn.com/dms/image/C4E03AQH8XRaqPqMvVg/profile-displayphoto-shrink_800_800/0/1547428419937?e=1622678400&v=beta&t=sLxTWk_T7fSeE1Fsyy2cwPgdYqLFdOFAy4iiEjjSTF0")
    fill_in("user_username", with: "ColbyMainard")
    fill_in('user_email', with: 'cmythman@gmail.com')
    fill_in('user_password', with: 'testpassword4ME@')
    fill_in('user_vPassword', with: 'testpassword4ME@')
    fill_in("user_discord_username", with: "colbymainard#3777")
    fill_in("user_instagram_handle", with: "colby_mainard")
    fill_in("user_github_link", with: "https://github.com/ColbyMainard")
    click_button('Create Account')
end

When(/^I fill out the bare minimum required for the signup form correctly and submit it$/) do
    fill_in("user_profile_picture_link", with: "")
    fill_in("user_username", with: "ColbyMainard")
    fill_in('user_email', with: 'cmythman@gmail.com')
    fill_in('user_password', with: 'testpassword4ME@')
    fill_in('user_vPassword', with: 'testpassword4ME@')
    fill_in("user_discord_username", with: "")
    fill_in("user_instagram_handle", with: "")
    fill_in("user_github_link", with: "")
    click_button('Create Account')
end

When(/^I fill out the entire signup form and forget the verification password and submit it$/) do
    fill_in("user_profile_picture_link", with: "https://media-exp1.licdn.com/dms/image/C4E03AQH8XRaqPqMvVg/profile-displayphoto-shrink_800_800/0/1547428419937?e=1622678400&v=beta&t=sLxTWk_T7fSeE1Fsyy2cwPgdYqLFdOFAy4iiEjjSTF0")
    fill_in("user_username", with: "ColbyMainard")
    fill_in('user_email', with: 'cmythman@gmail.com')
    fill_in('user_password', with: 'testpassword4ME@')
    fill_in('user_vPassword', with: '')
    fill_in("user_discord_username", with: "colbymainard#3777")
    fill_in("user_instagram_handle", with: "colby_mainard")
    fill_in("user_github_link", with: "https://github.com/ColbyMainard")
    click_button('Create Account')
end

Then(/^I should have successfully logged in as a new user$/) do
    expect(page).to have_text('Welcome to DevHub, ColbyMainard!!!')
end

Then(/^I should have unsuccessfully logged in as a new user$/) do
    expect(page).to have_text('Password and confirmation of password do not match.')
end