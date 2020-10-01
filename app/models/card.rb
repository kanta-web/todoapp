class Card < ApplicationRecord
  belongs_to :board
  has_one_attached :eyecatch
end
