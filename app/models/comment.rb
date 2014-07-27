class Comment < ActiveRecord::Base
  validates :text, :user_id, :article_id, presence: true

  belongs_to :user
  belongs_to :article
end
