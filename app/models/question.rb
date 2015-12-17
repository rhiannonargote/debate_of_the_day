# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  category   :text
#  for        :text
#  against    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  has_many :microposts
  belongs_to :user

  def for_posts
    microposts.where(:for => true)
  end

  def against_posts
    microposts.where(:for => false)
  end
end
