require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		admin = User.create!(:name => "Jay Wengrow",
								 :email => "example@railstutorial.org",
								 :password => "foobar",
								 :password_confirmation => "foobar")
		admin.toggle!(:admin)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(:name => name,
									 :email => email,
									 :password => password,
									 :password_confirmation => password)
		end
		User.all(:limit => 4).each do |user|
			3.times do
				user.commercials.create!(:transcript => Faker::Lorem.sentence(50))
			end
		end
	end
end

