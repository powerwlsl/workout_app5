class Exercise < ApplicationRecord
  belongs_to :user
  validates :duration, presence: true
  validates :detail, presence: true
  validates :date, presence: true

end
