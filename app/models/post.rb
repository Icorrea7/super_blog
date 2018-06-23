# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :description, length: { minimum: 250 }
  validates :title, :description, presence: true
end
