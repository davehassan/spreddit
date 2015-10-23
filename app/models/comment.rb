class Comment < ActiveRecord::Base
  validates :author, :post, :content, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
  has_many :child_comments,
    class_name: 'Comment', foreign_key: :parent_id, primary_key: :id
  belongs_to :parent, class_name: "Comment",
    foreign_key: :parent_id, primary_key: :id

end
