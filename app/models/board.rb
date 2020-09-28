class Board < ApplicationRecord
  has_one_attached :eyecatch
  belongs_to :user
end
