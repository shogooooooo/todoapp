# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks

  def has_been_written?(task)
    tasks.exists?(id: task.id)
  end
end
