class PostSub < ActiveRecord::Base

  validates :sub, :post, presence: true
  validates :sub, uniqueness: { scope: :post }

  belongs_to :sub
  belongs_to :post

end
