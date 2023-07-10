class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable ,polymorphic: true

  validates :body, length:{minimum:5, maximum:255}
end

