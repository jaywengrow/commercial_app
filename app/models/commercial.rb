# == Schema Information
# Schema version: 20110113194734
#
# Table name: commercials
#
#  id         :integer         not null, primary key
#  transcript :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  closed     :boolean
#

class Commercial < ActiveRecord::Base
	has_many :posts
	belongs_to :user

  validates :transcript, :presence => true
  validates :user_id,    :presence => true
  
  default_scope :order => 'commercials.created_at DESC'

end
