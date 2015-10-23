class Post < ActiveRecord::Base
  validates :title, :subs, :author, presence: true

  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs
  has_many :comments
end
