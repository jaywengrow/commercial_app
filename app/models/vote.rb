# == Schema Information
# Schema version: 20110112213437
#
# Table name: votes
#
#  id         :integer         not null, primary key
#  value      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
end
