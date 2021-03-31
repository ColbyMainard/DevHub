# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts = [{:username => 'user1', :post_title => 'Getting Started with Rails', :updated_at => '2021-03-30 19:49:20'},
    	  {:username => 'user2', :post_title => 'Creating a New Rails Project', :updated_at => '2021-03-30 19:49:20'},
    	  {:username => 'user3', :post_title => 'Hello, Rails!', :updated_at => '2021-03-30 19:49:20'},
      	  {:username => 'user1', :post_title => 'MVC and You', :updated_at => '2021-03-30 19:49:20'},
      	  {:username => 'user2', :post_title => 'CRUDit Where CRUDit Is Due', :updated_at => '2021-03-30 19:49:20'},
  	 ]
  	 
posts.each do |post|
    Post.find_or_create_by(post)
end

users = [{:username => 'user1', :email => '11111@gmail.com', :password => '1234567', :updated_at => '2021-03-30 19:49:20'},
    	  {:username => 'user2', :email => '22222@gmail.com', :password => '1234567', :updated_at => '2021-03-30 19:49:20'},
    	  {:username => 'user3', :email => '33333@gmail.com', :password => '1234567', :updated_at => '2021-03-30 19:49:20'},
      	  {:username => 'user4', :email => '44444@gmail.com', :password => '1234567', :updated_at => '2021-03-30 19:49:20'},
      	  {:username => 'user5', :email => '55555@gmail.com', :password => '1234567', :updated_at => '2021-03-30 19:49:20'},
  	 ]

users.each do |user|
    User.find_or_create_by(user)
end

