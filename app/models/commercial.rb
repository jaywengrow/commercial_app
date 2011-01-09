# == Schema Information
# Schema version: 20110109154607
#
# Table name: commercials
#
#  id         :integer         not null, primary key
#  transcript :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Commercial < ActiveRecord::Base
	belongs_to :user

  validates :transcript, :presence => true
  validates :user_id,    :presence => true
  
  default_scope :order => 'commercials.created_at DESC'

end
