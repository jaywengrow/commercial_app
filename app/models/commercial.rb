# == Schema Information
# Schema version: 20110117021313
#
# Table name: commercials
#
#  id         :integer         not null, primary key
#  transcript :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  closed     :boolean
#  title      :string(255)
#

class Commercial < ActiveRecord::Base
	#attr_accessible :title, :transcript
	
	has_many :posts
	belongs_to :user

  validates :transcript, :presence => true
  validates :user_id,    :presence => true
  validates :title,    :presence => true
  
  default_scope :order => 'commercials.created_at DESC'
  scope :limit_5, limit(5)
  


end
