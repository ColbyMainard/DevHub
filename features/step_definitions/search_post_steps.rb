Given (/the following posts exist/) do |posts_table|
  posts_table.hashes.each do |post|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Post.create (post)
  end
end

Then (/(.*) seed posts should exist/) do | n_seeds |
  Post.count.should be n_seeds.to_i
end

When (/^I press "([^"]*)"$/) do |button|
    click_button(button)
end


When (/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
    fill_in(field, :with => value)
end

Then (/^I should see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then (/^I should not see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

When (/^I follow "([^"]*)"$/) do |link|
  click_link(link)
end

Then(/^I should be redirected to the Advanced Search Page$/) do
    page_name =  '/searches/new'
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == page_name
    else
        assert_equal page_name, current_path
    end
end