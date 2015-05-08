class Comment < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :post, required: true
  validates :body, presence: true, length: {in: 10..40_000}
end
