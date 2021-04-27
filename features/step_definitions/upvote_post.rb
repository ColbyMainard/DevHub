When /I try to upvote post (.*)/ do |post_title|
    post_id = Post.where(:post_title => post_title)
    visit show_post_path(:id => post_id[0]['id'])
    click_link 'upvote_post_thumbs_up'
end

When /I try to downvote post (.*)/ do |post_title|
    post_id = Post.where(:post_title => post_title)
    visit show_post_path(:id => post_id[0]['id'])
    click_link 'downvote_post_thumbs_down'
end

Then /I should be able to successfully upvote (.*)/ do |post_title|
	post_id = Post.where(:post_title => post_title)
    visit show_post_path(:id => post_id[0]['id'])
    (find('#upvote_post_thumbs_up').text == '1' ) and (find('#downvote_post_thumbs_down').text == '0')
end

Then /I should be able to successfully downvote (.*)/ do |post_title|
	post_id = Post.where(:post_title => post_title)
    visit show_post_path(:id => post_id[0]['id'])
    (find('#upvote_post_thumbs_up').text == '0' ) and ( find('#downvote_post_thumbs_down').text == '1')
end

Then /I should not be able to successfully upvote (.*)/ do |post_title|
	post_id = Post.where(:post_title => post_title)
    visit show_post_path(:id => post_id[0]['id'])
    (find('#upvote_post_thumbs_up').text == '0' ) and ( find('#downvote_post_thumbs_down').text == '0')
end