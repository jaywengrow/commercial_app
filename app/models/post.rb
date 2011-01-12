# == Schema Information
# Schema version: 20110111223006
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
#

class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :commercial

	validates :title,      :presence => true
	validates :embed_text, :presence => true


end
