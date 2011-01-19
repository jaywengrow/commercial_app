require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		admin = User.create!(:name => "Jay Wengrow", # sample admin user
								 :email => "example@railstutorial.org",
								 :password => "foobar",
								 :password_confirmation => "foobar")
		admin.toggle!(:admin)
		business = User.create(:name => "The Pet Store", :email => "jaywngrw@gmail.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business.toggle!(:business_user)
		business2 = User.create(:name => "FBI", :email => "rebitzele1@gmail.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business2.toggle!(:business_user)
		business3 = User.create(:name => "Best Coffee", :email => "renawengrow@gmail.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business3.toggle!(:business_user)
		business4 = User.create(:name => "Chicago Public Library", :email => "jaywngrw@aol.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business4.toggle!(:business_user)
		business5 = User.create(:name => "Edible Cookies", :email => "rebitzele@aol.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business5.toggle!(:business_user)
		business.commercials.create!(:title => "Make our next Pet Store Super bowl ad and win airfare to London!", :transcript => "Self explanatory!") 
		business2.commercials.create!(:title => "Make a compelling case for others to join the FBI!", :transcript => "Prize: Awesome night vision goggles. Contest expires: 11/11/11.")
		business3.commercials.create!(:title => "Create a jingle describing the rich taste of our coffee and win a lot of coffee!", :transcript => "Self explanatory!")
		business4.commercials.create!(:title => "Make a cute commercial which conveys the importance of going to the library. Win $20,000!", :transcript => "Contest is over on December 31, 2011.")
		business5.commercials.create!(:title => "Explain what makes our cookies so edible and win TWO Concorde Jets!", :transcript => "Self explanatory!")
		
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(:name => name,
									 :email => email,
									 :password => password,
									 :password_confirmation => password)
		end
		poster = User.find(7)
		poster.posts.create!(:title => "Pick your pet!", :embed_text => "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/4xJsk0Vp7K0?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/4xJsk0Vp7K0?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>", :commercial_id => 1)
		#sleep(1.second)
		poster = User.find(8)
		poster.posts.create!(:title => "Get your pet at The Pet Store today!", :embed_text => "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/5SYnUUbJcWM?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/5SYnUUbJcWM?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>", :commercial_id => 1)
		#sleep(1.second)
		poster = User.find(9)
		poster.posts.create!(:title => "Join the FBI today!", :embed_text => "<object width=\"640\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/JIX0LsYuUHA?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/JIX0LsYuUHA?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"640\" height=\"385\"></embed></object>", :commercial_id => 2)
#		poster = User.find(9)
#		poster.posts.create!(:title => "Coffee health benefits", :embed_text => "<object width=\"640\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/lutMjeIIm-w?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/lutMjeIIm-w?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"640\" height=\"385\"></embed></object>", :commercial_id => 3)
		poster = User.find(9)
		poster.posts.create!(:title => "Go to the library, it's free!", :embed_text => "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/W3ZHPJT2Kp4?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/W3ZHPJT2Kp4?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>", :commercial_id => 4)
		poster = User.find(10)
		poster.posts.create!(:title => "Edible Cookies are as edible as can be.", :embed_text => "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/Ye8mB6VsUHw?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/Ye8mB6VsUHw?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>", :commercial_id => 5)


	end
end

