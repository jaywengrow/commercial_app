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
		business = User.create(:name => "The Pet Store", :email => "pets@thepetstore.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business.toggle!(:business_user)
		business2 = User.create(:name => "SmallMart", :email => "smallmart@smallmart.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business2.toggle!(:business_user)
		business3 = User.create(:name => "Best Coffee", :email => "best@coffee.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business3.toggle!(:business_user)
		business4 = User.create(:name => "Book Depot", :email => "book@depot.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business4.toggle!(:business_user)
		business5 = User.create(:name => "Edible Cookies", :email => "edible@cookies.com", #sample business user
													 :password => "business", :password_confirmation => "business")
		business5.toggle!(:business_user)
		business.commercials.create!(:title => "Make our next Pet Store Super bowl ad and win airfare to London!", :transcript => "Self explanatory!") 
		business2.commercials.create!(:title => "Make any originial commercial for SmallMart and win $1000 CASH!", :transcript => "Self explanatory!")
		business3.commercials.create!(:title => "Create a jingle describing the rich taste of our coffee and win a lot of coffee!", :transcript => "Self explanatory!")
		business4.commercials.create!(:title => "Display a funny scene about people buying books at our competitors! Win $20,000!", :transcript => "Self explanatory!")
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
		poster = User.find(4)
		poster.posts.create!(:title => "Pick my pet", :embed_text => "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/4xJsk0Vp7K0?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/4xJsk0Vp7K0?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>", :commercial_id => 1)
		#sleep(1.second)
		poster = User.find(5)
		poster.posts.create!(:title => "Elmo makes a cute pet, don't you think?", :embed_text => "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/vSYadh2xmcI?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/vSYadh2xmcI?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>", :commercial_id => 1)
		#sleep(1.second)
		poster = User.find(6)
		poster.posts.create!(:title => "The funniest SmallMart commercial ever!", :embed_text => "<object width=\"640\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/JIX0LsYuUHA?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/JIX0LsYuUHA?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"640\" height=\"385\"></embed></object>", :commercial_id => 2)

	end
end

