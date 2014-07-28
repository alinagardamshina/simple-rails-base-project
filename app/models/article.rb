class Article < ActiveRecord::Base
  validates :title, :text, :user_id, presence: true

  belongs_to :user
  has_many :comments

  delegate :email, to: :user, prefix: true
end
