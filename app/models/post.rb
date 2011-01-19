# == Schema Information
# Schema version: 20110117163458
#
# Table name: posts
#
#  id            :integer         not null, primary key
#  title         :string(255)
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  commercial_id :integer
#  vote_total    :integer
#  winner        :boolean
#  video_id      :string(255)
#

class Post < ActiveRecord::Base
	attr_accessor :embed_text
	#attr_accessible :title, :embed_text
	has_many   :votes, :dependent => :destroy
	belongs_to :user
	belongs_to :commercial

	validates :title,      :presence => true
	validates :embed_text, :presence => true, :on => :create
	
	before_create :extract_video_id
	before_create :initialize_vote_total
	
	scope :recent,  order('created_at DESC')
	scope :popular, order('vote_total DESC')
	scope :limit_3, limit(3)
	
	def extract_video_id
		self.video_id = /youtube.com\/v\/(\w*)\?/.match(embed_text)[1]	
	end
	
	def video_display
		return "<object width=\"480\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/" + video_id + "?fs=1&amp;hl=en_US&amp;rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/" + video_id + "?fs=1&amp;hl=en_US&amp;rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"480\" height=\"385\"></embed></object>"
	end
	
	def thumbnail	
  	thumbnail_url = "http://img.youtube.com/vi/" + video_id + "/1.jpg"
	end
	
	def initialize_vote_total
		self.vote_total = 0
	end


end
