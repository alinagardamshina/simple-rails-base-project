class User < ActiveRecord::Base
  devise(
    :registerable,
    :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :database_authenticatable
  )

  validates :full_name, presence: true

  has_many :articles
  has_many :comments

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
