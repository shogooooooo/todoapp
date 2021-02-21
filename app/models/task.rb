class Task < ApplicationRecord
  has_one_attached :eyecatch

  belongs_to :board
end
