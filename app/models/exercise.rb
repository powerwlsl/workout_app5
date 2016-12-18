class Exercise < ApplicationRecord
  belongs_to :user
  validates :duration, presence: true, numericality: {greater_than: 0.0}
  validates :detail, presence: true
  validates :date, presence: true
  # alias_attribute :  => if you want to use different name from db
end
