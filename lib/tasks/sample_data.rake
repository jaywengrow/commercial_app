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
													 :password => "loofapoofa", :password_confirmation => "loofapoofa")
		business.toggle!(:business_user)
		business.commercials.create!(:transcript => "Child: Hey, I want to get a puppy! \n Father: Sure thing, son! Let's go to The Pet Store!") #sample transcript
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(:name => name,
									 :email => email,
									 :password => password,
									 :password_confirmation => password)
		end
		poster = User.find(3)
		poster.posts.create!(:title => "My version of this cute commercial!", :embed_text => "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/4xJsk0Vp7K0?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/4xJsk0Vp7K0?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>", :commercial_id => 1)
#		User.all(:limit => 4).each do |user|
#			3.times do
#				user.commercials.create!(:transcript => Faker::Lorem.sentence(50))
#			end
#		end
	end
end

