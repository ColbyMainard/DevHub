Given(/^I am logged in$/) do
    click_link('Sign Up')
    fill_in('user_email', with: 'testuser@gmail.com')
    fill_in('user_name', with: 'Test_Username_68419')
    fill_in('user_password', with: 'testpassword')
    fill_in('user_vPassword', with: 'testpassword')
    click_button('Create Account')
    visit root_path
end

Given(/^I am not logged in$/)do

end
