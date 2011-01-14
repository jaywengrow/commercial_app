# == Schema Information
# Schema version: 20110113204929
#
# Table name: posts
#
#  id            :integer         not null, primary key
#  title         :string(255)
#  embed_text    :text
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  commercial_id :integer
#  vote_total    :integer
#  winner        :boolean
#

class Post < ActiveRecord::Base
	has_many   :votes, :dependent => :destroy
	belongs_to :user
	belongs_to :commercial

	validates :title,      :presence => true
	validates :embed_text, :presence => true
	
	scope :recent,  order('created_at DESC')
	scope :popular, order('vote_total DESC')
	
	def thumbnail
		video_id = /www.youtube.com\/v\/(.*)\?.*/.match(embed_text)[1]
		thumbnail_url = "http://img.youtube.com/vi/" + video_id + "/1.jpg"
	end


end
