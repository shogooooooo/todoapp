class Task < ApplicationRecord
  has_one_attached :eyecatch

  has_many :comments, dependent: :destroy
  belongs_to :board
end
