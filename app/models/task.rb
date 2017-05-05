class Task < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :description, presence: true
end
