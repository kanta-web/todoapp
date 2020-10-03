class Comment < ApplicationRecord
  belongs_to :board
  belongs_to :user
  belongs_to :card
end
