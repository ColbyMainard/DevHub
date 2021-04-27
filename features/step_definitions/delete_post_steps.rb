Given /I am logged in as (.*)/ do |username|
    visit signup_path
    fill_in('user_username', with: username)
    fill_in('user_email', with: username + '@gmail.com')
    fill_in('user_password', with: username + 'password')
    fill_in('user_vPassword', with: username + 'password')
    click_button('Create Account')
    visit root_path
end

When /I try to delete (.*)/ do |post_title|
	post_id = Post.where(:post_title => post_title)
	visit show_post_path(:id => post_id[0]['id'])
    begin
	   click_link 'Delete posts'
    rescue
    end
end

Then /I should be able to successfully delete (.*)/ do |post_title|
    page.has_content?("'" + post_title + "' was successfully deleted")
end

Then /I should not be able to successfully delete (.*)/ do |post_title|
    page.should have_no_content("'" + post_title + "' was successfully deleted")
end


Then(/^pending$/) do
end