Factory.define :user do |user|
  user.name                  "Jay Wengrowsky"
  user.email                 "jaywengrow@example.edu"
  user.password              "password"
  user.password_confirmation "password"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.sequence :name do |n|
	"John Boothington #{n}"
end

Factory.define :commercial do |commercial|
	commercial.transcript "This is the transcript!"
	commercial.association :user
end
