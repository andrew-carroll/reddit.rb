class Subreddit < ActiveRecord::Base
  validates :name, 
    uniqueness: {message: 'that subreddit already exists'},
    presence: true
  belongs_to :user, required: true

  def to_param
    name
  end
end
