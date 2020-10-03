class Card < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_one_attached :eyecatch
  has_many :comments,dependent: :destroy
end
