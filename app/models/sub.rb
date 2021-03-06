class Sub < ActiveRecord::Base

  validates :moderator, :title, :description, presence: true

  belongs_to :moderator,
    class_name: 'User',
    foreign_key: :moderator_id

  has_many :post_subs
  has_many :posts, through: :post_subs


end
